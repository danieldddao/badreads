class InholdController < ApplicationController
  before_action :set_current_user
  
  # def user_params
  #   params.require(:user).permit(:email)
  # end
  
  def index
  end

  def update
    
  end

  def change
    @user = User.find_by_email(params[:email])
    
    if @user.present?
      @user.in_hold = !@user.in_hold
      if @user.save(validate: false)
        flash[:notice] = "Your change was made successfully"
        redirect_to hold_path
      else
        flash[:notice] = "Something went wrong!!"
        redirect_to hold_path
      end
    else 
      flash[:warning] = "User doesn't exist"
      redirect_to hold_path
    end
  end  

end
