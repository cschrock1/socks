class WelcomeController < ApplicationController::Base
  layout "custom_page"

  def index
    @custom_stylesheet = "welcome"
  end
end