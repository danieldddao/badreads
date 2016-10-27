class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def set_current_user
    @current_user ||= session[:session_token ] && User.find_by_session_token(session[:session_token])
  end

  def current_user?(id)
    @current_user.id.to_s == id
  end  
end
