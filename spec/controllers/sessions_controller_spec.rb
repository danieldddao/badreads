require 'spec_helper'
require 'rails_helper'

describe SessionsController do
  
  describe 'creating sessions' do
    it 'should log in for correct email/combination and redirect to homepage' do
      fake_user = [double("User")]
      allow(User).to receive(:find_by_email).with("testuser1@gmail.com").and_return(fake_user[0])
      allow(fake_user[0]).to receive(:authenticate).with("123456").and_return(true)
      allow(fake_user[0]).to receive(:session_token).and_return("token")
      allow(fake_user[0]).to receive(:email_confirmed).and_return(true)
      
      post :create, params: {:session => {:email => "testuser1@gmail.com", :password => "123456"}}
      expect(response).to redirect_to(books_path)
      expect(session[:session_token]).to eq("token")
    end
    it 'should show error for unconfirmed account' do
      fake_user = [double("User")]
      allow(User).to receive(:find_by_email).with("testuser1@gmail.com").and_return(fake_user[0])
      allow(fake_user[0]).to receive(:authenticate).with("123456").and_return(true)
      allow(fake_user[0]).to receive(:session_token).and_return("token")
      allow(fake_user[0]).to receive(:email_confirmed).and_return(false)
      
      post :create, params: {:session => {:email => "testuser1@gmail.com", :password => "123456"}}
      expect(flash[:warning]).to eq("Please confirm your account in the link sent to your email to log in!")
      expect(response).to redirect_to(login_path)
    end
    it 'should render template for incorrect email/password combination' do
      post :create, params: {:session => {:email => "testuser@gmail.com", :password => "123456"}}
      expect(flash[:warning]).to eq("Invalid email/password combination")
      expect(response).to render_template("new")
    end
  end
  
  describe 'destroying sessions' do
    it 'should log out current user and redirect to homepage' do
      delete :destroy
      expect(session[:session_token]).to be_nil
      expect(assigns(:current_user)).to be_nil
      expect(flash[:notice]).to eq("You have logged out")
      expect(response).to redirect_to(books_path)
    end
  end
  
end
