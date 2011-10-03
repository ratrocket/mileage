class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery

  private
  def set_user
    @user ||= current_user  # dunno about the ||= ...
  end
end
