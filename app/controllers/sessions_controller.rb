class SessionsController < ApplicationController

  def session_params
    params.require(:user).permit(:user_id, :email)
  end
  
  def new
  end

  def create
    if session_params[:user_id] == ""
      flash[:warning] = "Sorry, user-id cannot be empty."
      redirect_to login_path
    elsif session_params[:email] == ""
      flash[:warning] = "Sorry, email cannot be empty."
      redirect_to login_path
    elsif !User.exists?(user_id: session_params[:user_id], email: session_params[:email])
      flash[:warning] = "Sorry, invalid user-id/email."
      redirect_to login_path
    else
      user = User.where(user_id: session_params[:user_id]).first
      session[:session_token] = user.session_token
      redirect_to movies_path
    end
  end

  def destroy
    @current_user=nil
    session[:session_token] = nil
    flash[:notice] = "You are logged out"
    redirect_to movies_path
  end

end
