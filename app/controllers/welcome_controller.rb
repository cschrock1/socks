class WelcomeController < ApplicationController
  layout "custom_page"

  before_action :redirect_signed_in_users

  def index
    @custom_stylesheet = "welcome"
  end

private

  def redirect_signed_in_users
    if current_user
      redirect_to socks_path
    end
  end
end
