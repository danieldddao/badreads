class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      #sign in and redirect to show page
      session[:session_token] = user.session_token
      redirect_to books_path
    else
      flash.now[:warning] = 'Invalid email/password combination'
      render 'new'
    end  
  end

  def destroy
    session[:session_token] = nil
    @current_user = nil
    flash[:notice] = 'You have logged out'
    redirect_to books_path
  end

end
