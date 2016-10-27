class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role)
  end
  
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    puts "Testing"
    puts @user
    if @user     
      flash[:notice] = "Sign up successfully!"       
      redirect_to login_path    
    else
      render 'new'
    end
  end
  
  def update
  end

  def destroy
  end

end
