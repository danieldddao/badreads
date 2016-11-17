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
        expect(flash[:notice]).to eq("Sign up successfuly! Welcome to BadReads!")
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
        expect(flash[:notice]).to eq("Sign up successfuly! Welcome to BadReads!")
        expect(response).to redirect_to(login_path)
      end
    end
  end
  
  describe 'updating users' do
  end
  
  describe 'destroying users' do
  end
  
end
