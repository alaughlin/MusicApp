class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def signin!(user)
    session[:session_token] = user.reset_session_token!
  end

  def signout
    session[:session_token] = nil
  end

  def current_user
    return unless session[:session_token]
    user = User.find_by_session_token(session[:session_token])

    user
  end

  def signed_in?
    !!current_user
  end
end
