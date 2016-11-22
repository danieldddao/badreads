class FollowsController < ApplicationController
  before_action :set_current_user
  
  def create
    if @current_user
      user = User.find(params[:user_id])
      if @current_user != user.id
        follow = user.follows.new(:follower_id => @current_user.id);
        begin
          follow.save
          flash[:warning] = "Successfully followed user: #{user.first_name} #{user.last_name}"
        rescue ActiveRecord::RecordNotUnique
        flash[:warning] = "Error! You already followed this user!"
        end
      else
        flash[:warning] = "Error! You can't follow yourself!"
      end
    else
      flash[:warning] = "Error! Please log-in to follow a user!"
    end
    redirect_to(book_path(params[:book_id]))
  end
  
end
