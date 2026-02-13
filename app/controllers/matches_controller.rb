class MatchesController < ApplicationController
  before_action :load_sock, only: [:new, :create]

  # GET /socks/{:sock_id}/matches/new
  def new
    @match = Match.new
    @socks = Sock.all
  end

  # POST /socks/{sock_id}/matches
  def create
    @match = Match.new(sock_1_id: params[:sock_id], sock_2_id: params[:match][:match_id])
    @match.save
    redirect_to @sock, notice: "Match was successfully created."
  end

  # GET /matches
  def index
    @matches = Match.includes(:sock_1, :sock_2).all
  end

  # DELETE /matches/:id
  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    redirect_to matches_path, notice: "Match removed."
  end

private

  def load_sock
    @sock = Sock.find(params[:sock_id])
  end
end
