require 'spec_helper'
require 'rails_helper'

describe Follow do
    describe "check current user has followed users" do
        it "should return false if current user has followed no users" do
            current_user = User.create!(:email => "admin@gmail.com", :first_name => "Default", :last_name => "Admin", :password => "123456", :password_confirmation => "123456", :position => "Admin")
            this_user = User.create!(:email => "staff@gmail.com", :first_name => "Default", :last_name => "Staff", :password => "123456", :password_confirmation => "123456", :position => "Staff")
            result = Follow.has_current_user_followed_this_user(current_user, this_user)
            expect(result).to be_falsy
        end
        it "should return true if current user has followed some users" do
            current_user = User.create!(:email => "admin@gmail.com", :first_name => "Default", :last_name => "Admin", :password => "123456", :password_confirmation => "123456", :position => "Admin")
            this_user = User.create!(:email => "staff@gmail.com", :first_name => "Default", :last_name => "Staff", :password => "123456", :password_confirmation => "123456", :position => "Staff")
            Follow.create!(:follower_id => current_user.id, :followedUser_id => this_user.id)
            result = Follow.has_current_user_followed_this_user(current_user, this_user)
            expect(result).to be_truthy
        end
    end
end
