class ProposalsController < ApplicationController
  # Load sock only when a nested `sock_id` is present (nested routes)
  before_action :load_sock, only: [:new, :create], if: -> { params[:sock_id].present? }

  # GET /socks or /{:sock_id
  def new
    @proposal = Proposal.new
    @socks = Sock.all
  end

  # This action creates a new proposed match between two socks.
  def create
    # Support both nested (params[:sock_id]) and top-level form submissions
    if params[:sock_id].present?
      sock_1_id = params[:sock_id]
      sock_2_id = params.dig(:proposal, :match_id)
    else
      sock_1_id = params.dig(:proposal, :sock_1_id) || params.dig(:proposal, :sock_1)
      sock_2_id = params.dig(:proposal, :sock_2_id) || params.dig(:proposal, :sock_2) || params.dig(:proposal, :match_id)
    end

    @proposal = Proposal.new(sock_1_id: sock_1_id, sock_2_id: sock_2_id)
    @proposal.save!
    if defined?(@sock) && @sock.present?
      redirect_to @sock, notice: "Proposed match was successfully created."
    else
      redirect_to proposals_path, notice: "Proposed match was successfully created."
    end
  end

  # GET /proposals
  def index
    @proposals = Proposal.includes(:sock_1, :sock_2).all
  end

  # POST /proposals/:id/accept
  def accept
    @proposal = Proposal.find(params[:id])
    ActiveRecord::Base.transaction do
      Match.create!(sock_1_id: @proposal.sock_1_id, sock_2_id: @proposal.sock_2_id)
      # remove any duplicate proposals between these socks
      Proposal.where(sock_1_id: @proposal.sock_1_id, sock_2_id: @proposal.sock_2_id).or(Proposal.where(sock_1_id: @proposal.sock_2_id, sock_2_id: @proposal.sock_1_id)).destroy_all
    end
    redirect_to proposals_path, notice: "Proposal accepted — match created."
  rescue ActiveRecord::RecordInvalid => e
    redirect_to proposals_path, alert: "Unable to accept proposal: #{e.message}"
  end

  # POST /proposals/:id/reject
  def reject
    @proposal = Proposal.find(params[:id])
    @proposal.destroy
    redirect_to proposals_path, notice: "Proposal rejected."
  end

private
  # This method finds and loads the sock using parameters from the request.
  def load_sock
    @sock = Sock.find(params[:sock_id])
  end
end
