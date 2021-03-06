class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      #sign in and redirect to show page
      if user.email_confirmed
          # sign_in user
        # redirect_back_or user
        session[:session_token] = user.session_token
        redirect_to books_path
      else
        flash[:warning] = 'Please confirm your account in the link sent to your email to log in!'
        redirect_to login_path
      end
    else
      flash[:warning] = 'Invalid email/password combination'
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
