class DashboardController < ApplicationController
  def welcome
    @socks = Sock.all
  end
end
