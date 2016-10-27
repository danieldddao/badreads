class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :position)
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
    if user_params[:position] != "User"
      role = Role.where(:position => user_params[:position], :position_code => params[:code])
      if params[:position_code].blank?
        puts "code is blank"
        @user.errors.add(:position_code, "must not be empty if selected role is '#{user_params[:position]}'")
        render 'new' and return
      elsif role.empty?
        puts "not found role"
        @user.errors.add(:position_code, "is invalid")
        render 'new' and return
      else
        puts "found role"
        Role.destroy(role[0].id) #remove the position_code and position
      end
    end
    
    if @user.save
      flash[:notice] = "Sign up successfuly! Welcome to BadReads!"
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
