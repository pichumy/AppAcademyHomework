class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def login(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def logout
    current_user.reset_session_token!
    # delete le cookies
    session[:session_token] = nil
  end

  def current_user
    # check if hab cookies
    return nil unless session[:session_token]
    # if hab cookies, find in database
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  # def require_log_out
  #   redirect_to cats_url if logged_in?
  # end
end
