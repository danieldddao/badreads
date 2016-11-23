class FollowsController < ApplicationController
  before_action :set_current_user
  
  def create
    if @current_user
      user = User.find(params[:user_id])
      if user
        if @current_user != user.id
          following = @current_user.followings.new(:followedUser_id => user.id);
          begin
            if following.save
              flash[:notice] = "Successfully followed user: #{user.first_name} #{user.last_name}"
            else
              flash[:warning] = "Something went wrong, please try again!"
            end
          rescue ActiveRecord::RecordNotUnique
          flash[:warning] = "Error! You already followed this user!"
          end
        else
          flash[:warning] = "Error! You can't follow yourself!"
        end
      else
       flash[:warning] = "Error! User you want to follow doesn't exist!"
      end
    else
      flash[:warning] = "Error! Please log-in to follow a user!"
    end
    redirect_to(book_path(params[:book_id]))
  end
  
  def destroy
    if @current_user
      user = User.find(params[:user_id])
      if user
        if @current_user != user.id
          if !@current_user.followings.empty?
            @current_user.followings.each {|following|
              if following.followedUser.id == user.id
                following.destroy!
                flash[:notice] = "Successfully unfollowed user: #{user.first_name} #{user.last_name}"
              end
            }
          else
            flash[:warning] = "Error! You're currently not following anyone, can't unfollow!"
          end
        else
          flash[:warning] = "Error! You can't unfollow yourself!"
        end
      else
        flash[:warning] = "Error! User you want to unfollow doesn't exist!"
      end
    else
      flash[:warning] = "Error! Please log-in to unfollow a user!"
    end
    if params[:book_id] != "0"
      redirect_to(book_path(params[:book_id]))
    elsif @current_user
      redirect_to(user_show_following_path(@current_user))
    else
      redirect_to(root_path)
    end
  end
  
  def showFollowings
  end
  
  def showFollowers
  end
end
