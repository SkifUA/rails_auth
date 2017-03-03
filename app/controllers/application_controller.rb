class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  # get user by id from data session
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # check auth user
  def require_user
    redirect_to '/login' unless current_user
  end

  # check user by role editor or admin
  def require_editor
    redirect_to '/' unless (current_user.editor? || current_user.admin?)
  end

  # check user by role admin
  def require_admin
    redirect_to '/' unless current_user.admin?
  end
end
