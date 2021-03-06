require 'spec_helper'
require 'rails_helper'

describe UsersController do
  describe 'showing users' do
    it 'should show requesting user profile' do
      controller.instance_variable_set(:@current_user, User.new(:id => 1)) 
      get :show, params: {:id => 1}
      expect(response).to render_template("show")
    end
    it 'should show warning message for incorrect requesting user profile' do
      controller.instance_variable_set(:@current_user, User.new(:id => 0)) 
      get :show, params: {:id => 1}
      expect(flash[:warning]).to eq("Can only show proﬁle of logged-in user")
    end
  end
  
  describe 'creating new users' do
    fixtures :roles
    context 'New User' do
      it 'should create new user and redirect to signin page' do
        post :create, params: {:user => {:first_name => "testfirstname", :last_name =>"testlastname", :email => "testemail@gmail.com", :password => "123456", :password_confirmation => "123456", :position => "User"}}
        expect(flash[:notice]).to eq("Sign up successfuly! Please confirm your email address.")
        expect(response).to redirect_to(login_path)
      end
      it 'should create new user and redirect to signin page in production environment' do
        fake_request = [double("Request")]
        fake_env = [double("Environment")]
        allow(Rails).to receive(:env).and_return(fake_env[0])
        allow(fake_env[0]).to receive(:production?).and_return(true)
        post :create, params: {:user => {:first_name => "testfirstname", :last_name =>"testlastname", :email => "testemail@gmail.com", :password => "123456", :password_confirmation => "123456", :position => "User"}}
        expect(flash[:notice]).to eq("Sign up successfuly! Please confirm your email address.")
        expect(response).to redirect_to(login_path)
      end
      it 'should render template for incorrect information format' do
        post :create, params: {:user => {:first_name => "", :last_name =>"testlastname", :email => "testemail@gmail.com", :password => "123456", :password_confirmation => "123456", :position => "User"}}
        expect(response).to render_template("new")
      end
    end
    context 'New Staff/Admin' do
      it 'should render template for empty code' do
        post :create, params: {:user => {:first_name => "testfirstname", :last_name =>"testlastname", :email => "testemail@gmail.com", :password => "123456", :password_confirmation => "123456", :position => "Staff"}}
        expect(assigns(:user).errors.full_messages[0]).to eq("Position code must not be empty if selected role is 'Staff'")
        expect(response).to render_template("new")
      end
      it 'should render template for wrong code' do
        post :create, params: {:position_code => "123456", :user => {:first_name => "testfirstname", :last_name =>"testlastname", :email => "testemail@gmail.com", :password => "123456", :password_confirmation => "123456", :position => "Staff"}}
        expect(assigns(:user).errors.full_messages[0]).to eq("Position code is invalid")
        expect(response).to render_template("new")
      end
      it 'should create new user and redirect to signin page for correct code' do
        expect(Role.count).to eq(2)
        post :create, params: {:position_code => "Admin1", :user => {:first_name => "testfirstname", :last_name =>"testlastname", :email => "testemail@gmail.com", :password => "123456", :password_confirmation => "123456", :position => "Admin"}}
        expect(Role.count).to eq(1)
        expect(flash[:notice]).to eq("Sign up successfuly! Please confirm your email address.")
        expect(response).to redirect_to(login_path)
      end
    end
  end
  
  describe 'updating users' do
    it 'should update user with new password' do
      controller.instance_variable_set(:@current_user, User.new(:id => 1)) 
      fake_user = [double("User")]
      allow(User).to receive(:find_by_id).with("2").and_return(fake_user[0])
      allow(fake_user[0]).to receive(:id).and_return(1)
      allow(fake_user[0]).to receive(:authenticate).with("123456").and_return(true)
      allow(fake_user[0]).to receive(:update_attributes).and_return(true)
      allow(fake_user[0]).to receive(:session_token).and_return("session token")
      put :update, params: {:id => 2, :user => {:new_password => "abcdef", :password => "abcdef", :current_password => "123456"}}
      expect(flash[:notice]).to eq("Password successfully changed")
      expect(response).to redirect_to(user_path(1))
    end
    it 'should show error for incorrect password' do
      controller.instance_variable_set(:@current_user, User.new(:id => 1)) 
      fake_user = [double("User")]
      allow(User).to receive(:find_by_id).with("2").and_return(fake_user[0])
      allow(fake_user[0]).to receive(:id).and_return(2)
      allow(fake_user[0]).to receive(:authenticate).with("123456").and_return(false)
      put :update, params: {:id => 2, :user => {:new_password => "abcdef", :password => "abcdef", :current_password => "123456"}}
      expect(flash[:warning]).to eq("Password Change not successful, Please try again!")
      expect(response).to redirect_to(edit_user_path(1))
    end
  end
  
  describe 'email referal' do
    it 'should send email and redirect to user' do
      controller.instance_variable_set(:@current_user, User.new(:id => 1, :email => "current@gmail.com")) 
      post :emailref, params: {:send_referral => "test@gmail.com"}
      expect(response).to redirect_to(user_path(1))
    end
  end
  
  describe 'email password' do
    fixtures :users
    it 'should send email and redirect to user' do
      post :emailpwd, params: {:email => "testuser1@gmail.com"}
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq("The new password has been sent to your email-id.")
    end
    it 'should show error for non-existing email' do
      post :emailpwd, params: {:email => "test@gmail.com"}
      expect(response).to redirect_to(root_path)
      expect(flash[:warning]).to eq("Your email doesn't exist in our system!")
    end
  end
  
  describe 'confirm email check' do
    it 'should send email and redirect to user' do
      fake_user = [double("User")]
      allow(User).to receive(:find).with("3").and_return(fake_user[0])
      allow(fake_user[0]).to receive(:authenticate).with("123456").and_return(true)
      allow(fake_user[0]).to receive(:confirm_token).and_return("123456")
      allow(User).to receive(:email_activate).and_return(fake_user[0], "123456")

      post :confirm_email_check, params: {:id => 3, :confirm_token => "123456", :user => {:password => "123456"}}
      expect(flash[:notice]).to eq("Welcome to the Badreads App! Your email has been confirmed. Please sign in to continue.")
      expect(response).to redirect_to(login_path)
    end
    it 'should show message for activated account' do
      fake_user = [double("User")]
      allow(User).to receive(:find).with("3").and_return(fake_user[0])
      allow(fake_user[0]).to receive(:authenticate).with("123456").and_return(true)
      allow(fake_user[0]).to receive(:confirm_token).and_return("")
      allow(fake_user[0]).to receive(:email_confirmed).and_return(true)

      post :confirm_email_check, params: {:id => 3, :confirm_token => "123456", :user => {:password => "123456"}}
      expect(flash[:notice]).to eq("You already activated your account! You can login now!")
      expect(response).to redirect_to(login_path)
    end
    it 'should show message for incorrect password' do
      fake_user = [double("User")]
      allow(User).to receive(:find).with("3").and_return(fake_user[0])
      allow(fake_user[0]).to receive(:authenticate).with("123456").and_return(false)
      allow(fake_user[0]).to receive(:confirm_token).and_return("123456")
      allow(fake_user[0]).to receive(:email_confirmed).and_return(false)

      post :confirm_email_check, params: {:id => 3, :confirm_token => "123456", :user => {:password => "123456"}}
      expect(flash[:warning]).to eq("Sorry! Password is not correct!")
      expect(response).to redirect_to(confirm_user_email_path)
    end
    it 'should show message for incorrect url' do
      fake_user = [double("User")]
      allow(User).to receive(:find).with("3").and_return(fake_user[0])
      allow(fake_user[0]).to receive(:authenticate).with("123456").and_return(true)
      allow(fake_user[0]).to receive(:confirm_token).and_return("123456213")
      allow(fake_user[0]).to receive(:email_confirmed).and_return(false)

      post :confirm_email_check, params: {:id => 3, :confirm_token => "123456", :user => {:password => "123456"}}
      expect(flash[:warning]).to eq("Sorry! URL is not correct! Can't activate your account!")
      expect(response).to redirect_to(root_path)
    end
  end
end
