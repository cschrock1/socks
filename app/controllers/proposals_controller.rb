class ProposalsController < ApplicationController
  # This call runs before every action and loads the sock based on the sock_id parameter from the URL.
  before_action :load_sock

  # GET /socks or /{:sock_id
  def new
    @proposal = Proposal.new
    @socks = Sock.all
  end

  # This action creates a new proposed match between two socks.
  def create
    # Uses the same simple parameter style as MatchesController for consistency.
    @proposal = Proposal.new(sock_1_id: params[:sock_id], sock_2_id: params[:proposal][:match_id])
    # Save the proposed match to the database
    @proposal.save!
    redirect_to @sock, notice: "Proposed match was successfully created."
  end

private
  # This method finds and loads the sock using parameters from the request.
  def load_sock
    @sock = Sock.find(params[:sock_id])
  end
end
