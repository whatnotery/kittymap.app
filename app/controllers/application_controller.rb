class ApplicationController < ActionController::Base
  include Passwordless::ControllerHelpers
  helper_method :current_user, :current_user_is_admin?

  private

  def current_user
    @current_user ||= authenticate_by_session(User)
  end

  def require_user!
    return if current_user
    redirect_to root_path, flash: {error: "Please sign in"}
  end

  def current_user_is_admin?
    current_user.is_admin
  end
end
