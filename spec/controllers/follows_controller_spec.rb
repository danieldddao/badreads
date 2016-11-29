require 'spec_helper'
require 'rails_helper'

describe FollowsController do
    describe "follow a user" do
        fixtures :users
        it "should show error for unregistered user" do
            post :create, params: {:user_id => 1, :book_id => 1}
            expect(flash[:warning]).to eq("Error! Please log-in to follow a user!")
            expect(response).to redirect_to(book_path(1))
        end
        it "should show error for non-existing following user" do
            controller.instance_variable_set(:@current_user, User.new(:id => 1, :position => "Staff")) 
            post :create, params: {:user_id => 0, :book_id => 1}
            expect(flash[:warning]).to eq("Error! User you want to follow doesn't exist!")
            expect(response).to redirect_to(book_path(1))
        end
        it "should show error for user following himself or herself" do
            controller.instance_variable_set(:@current_user, User.new(:id => 1, :position => "Staff")) 
            fake_user = [double("User")]
            allow(User).to receive(:find_by_id).with("1").and_return(fake_user[0])
            allow(fake_user[0]).to receive(:id).and_return(1)
            post :create, params: {:user_id => 1, :book_id => 1}
            expect(flash[:warning]).to eq("Error! You can't follow yourself!")
            expect(response).to redirect_to(book_path(1))
        end
        it "should create new follow" do
            controller.instance_variable_set(:@current_user, User.find_by_id(1)) 
            User.create!(:email => "user1@gmail.com", :first_name => "User", :last_name => "No.1", :password => "123456", :password_confirmation => "123456", :position => "User")
            post :create, params: {:user_id => User.find_by_email("user1@gmail.com").id, :book_id => 1}
            expect(flash[:notice]).to eq("Successfully followed user: User No.1")
            expect(response).to redirect_to(book_path(1))
        end
        it "should show error if follow is not saved" do
            controller.instance_variable_set(:@current_user, User.new(:id => 2, :position => "Staff")) 
            fake_follows = [double("follows")]
            fake_follow = [double("Follow")]
            allow(assigns(:current_user)).to receive(:followings).and_return(fake_follows[0])
            allow(fake_follows[0]).to receive(:new).and_return(fake_follow[0])
            allow(fake_follow[0]).to receive(:save).and_return(false)
            post :create, params: {:user_id => 1, :book_id => 1}
            expect(flash[:warning]).to eq("Something went wrong, please try again!")
            expect(response).to redirect_to(book_path(1))
        end
        it "should show error if follow already exists" do
            controller.instance_variable_set(:@current_user, User.new(:id => 2, :position => "Staff")) 
            fake_follows = [double("follows")]
            fake_follow = [double("Follow")]
            allow(assigns(:current_user)).to receive(:followings).and_return(fake_follows[0])
            allow(fake_follows[0]).to receive(:new).and_return(fake_follow[0])
            allow(fake_follow[0]).to receive(:save).and_raise(ActiveRecord::RecordNotUnique)
            post :create, params: {:user_id => 1, :book_id => 1}
            expect(flash[:warning]).to eq("Error! You already followed this user!")
            expect(response).to redirect_to(book_path(1))
        end
    end
    
    describe "unfollow a user" do
        fixtures :users
        it "should show error for unregistered user in book" do
            delete :destroy, params: {:user_id => 1, :book_id => 1}
            expect(flash[:warning]).to eq("Error! Please log-in to unfollow a user!")
            expect(response).to redirect_to(book_path(1))
        end
        it "should show error for unregistered user in homepage" do
            delete :destroy, params: {:user_id => 1, :book_id => 0}
            expect(flash[:warning]).to eq("Error! Please log-in to unfollow a user!")
            expect(response).to redirect_to(root_path)
        end
        it "should show error for non-existing followed user" do
            controller.instance_variable_set(:@current_user, User.new(:id => 1, :position => "Staff")) 
            delete :destroy, params: {:user_id => 0, :book_id => 1}
            expect(flash[:warning]).to eq("Error! User you want to unfollow doesn't exist!")
            expect(response).to redirect_to(book_path(1))
        end
        it "should show error for user unfollowing himself or herself" do
            controller.instance_variable_set(:@current_user, User.new(:id => 1, :position => "Staff")) 
            fake_user = [double("User")]
            allow(User).to receive(:find_by_id).with("1").and_return(fake_user[0])
            allow(fake_user[0]).to receive(:id).and_return(1)
            delete :destroy, params: {:user_id => 1, :book_id => 1}
            expect(flash[:warning]).to eq("Error! You can't unfollow yourself!")
            expect(response).to redirect_to(book_path(1))
        end
        it "should show error if current user isn't following anyone" do
            controller.instance_variable_set(:@current_user, User.find_by_id(1)) 
            User.create!(:email => "user1@gmail.com", :first_name => "User", :last_name => "No.1", :password => "123456", :password_confirmation => "123456", :position => "User")
            delete :destroy, params: {:user_id => User.find_by_email("user1@gmail.com").id, :book_id => 0}
            expect(flash[:warning]).to eq("Error! You're currently not following anyone, can't unfollow!")
            expect(response).to redirect_to(user_show_following_path(1))
        end
        it "should unfollow existing followed user" do
            controller.instance_variable_set(:@current_user, User.new(:id => 2, :position => "Staff")) 
            fake_follows = [double("follows")]
            fake_follow = [double("Follow")]
            allow(assigns(:current_user)).to receive(:followings).and_return(fake_follows)
            allow(fake_follows[0]).to receive(:followedUser).and_return(fake_follow[0])
            allow(fake_follow[0]).to receive(:id).and_return(1)
            allow(fake_follows[0]).to receive(:destroy!).and_return(true)
            delete :destroy, params: {:user_id => 1, :book_id => 1}
            expect(flash[:notice]).to eq("Successfully unfollowed user: testfirstname1 testlastname1")
            expect(response).to redirect_to(book_path(1))
        end
    end
end