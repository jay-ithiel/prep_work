class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login!(user)
    user.reset_token!
    @current_user = user
    session[:session_token] = user.session_token
  end

  def logout!
    current_user.reset_token!
    session[:session_token] = nil
  end

  def ensure_logged_in!
    redirect_to new_session_url unless current_user
  end
end
