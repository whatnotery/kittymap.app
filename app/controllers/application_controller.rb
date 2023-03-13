class ApplicationController < ActionController::Base
include Passwordless::ControllerHelpers
  helper_method :current_user, :current_user_match

  private

  def current_user
    @current_user ||= authenticate_by_session(User)
  end

  def require_user!
    return if current_user
    redirect_to root_path, flash: { error: 'Please sign in' }
  end

  def current_user_match
    current_user and (current_user.is_admin or current_user == @user) or (current_user == @cat.user if @cat)
  end
end