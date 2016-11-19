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
      flash[:notice] = "Sign up successfuly! Welcome to BadReads!"
      redirect_to login_path
    else
      render 'new'
    end
  end
  def edit
  
  end
  
  
  def update
    # @user = User.find_by_id(@current_user.id)
    # if @user.update_attributes(:password => params[:password], :password_confirmation => params[:password_confirmation])
    #   flash[:notice] = "Password changed successfuly!"
    #   redirect_to user_path(@current_user)
    # else
    #   render 'show'
    # end
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(:password => params[:user][:password], :password_confirmation => params[:user][:password])
       flash[:notice] = "Password successfuly changed"
       print @user.password
       print @user.id
       redirect_to root_path
     else
       flash[:warning] = "Password Change not successfull"
       redirect_to root_path
     end
  end
  
end


# private 

#   def user_params1
#     params.require(:user).permit(:password)
#   end 