class UsersController < ApplicationController
  before_action :set_current_user

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :position)
  end

  def show
    @user = @current_user
    if !current_user?(params[:id])       
      flash[:warning]= 'Can only show proﬁle of logged-in user'     
    end  
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if user_params[:position] != "User"
      role = Role.where(:position => user_params[:position], :position_code => params[:position_code])
      if params[:position_code].blank?
        @user.errors.add(:position_code, "must not be empty if selected role is '#{user_params[:position]}'")
        render 'new' and return
      elsif role.empty?
        @user.errors.add(:position_code, "is invalid")
        render 'new' and return
      else
        Role.destroy(role[0].id) #remove the position_code and position
      end
    end
    
    if @user.save
      UserMailer.registration_confirmation(@user, request).deliver
      flash[:notice] = "Sign up successfuly! Please confirm your email address."
      redirect_to login_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  
  def update
    npwd=params[:user][:new_password]
    rnpwd=params[:user][:password]
    user = User.find_by_id(params[:id])
    if (npwd == rnpwd) && user && @current_user && @current_user.id == user.id && user.authenticate(params[:user][:current_password])
     user.update_attributes(:password => params[:user][:password], :password_confirmation => params[:user][:password])
     session[:session_token] = user.session_token
     flash[:notice] = "Password successfully changed"
     redirect_to user_path(@current_user)
    else
     flash[:warning] = "Password Change not successful, Please try again!"
     redirect_to edit_user_path(@current_user)
    end
  end

  def emailref
    pass_referral=params[:send_referral]
    UserMailer.new_referral(pass_referral,@current_user.email).deliver
    redirect_to user_path(@current_user)
  end
  def emailpwd
    require 'securerandom'
    reset_pwd= SecureRandom.hex(6)
    email_reset= params[:email]
    @user = User.find_by_email(params[:email])
    if @user
      @user.update_attributes(:password => reset_pwd, :password_confirmation => reset_pwd)
      UserMailer.reset_password(reset_pwd,email_reset).deliver
      flash[:notice] = "The new password has been sent to your email-id."
      redirect_to root_path
    else
      flash[:warning] = "Your email doesn't exist in our system!"
      redirect_to root_path
    end
  end
  
  def confirm_email
  end

  def confirm_email_check
    user = User.find(params[:id])
    if user && user.authenticate(params[:user][:password]) && user.confirm_token == params[:confirm_token]
      User.email_activate(user, params[:user][:password])
      flash[:notice] = "Welcome to the Badreads App! Your email has been confirmed. Please sign in to continue."
      redirect_to login_path 
    else
      if user && user.email_confirmed == true
        flash[:notice] = "You already activated your account! You can login now!"
        redirect_to login_path 
      elsif user && !user.authenticate(params[:user][:password])
        flash[:warning] = "Sorry! Password is not correct!"
        redirect_to confirm_user_email_path
      else
        flash[:warning] = "Sorry! URL is not correct! Can't activate your account!"
        redirect_to root_path
      end
    end
  end
 
end
