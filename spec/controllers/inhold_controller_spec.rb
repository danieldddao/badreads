require 'rails_helper'

RSpec.describe InholdController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #change" do
    fixtures :users
    it "change successfully" do
      get :change, params:  {:email => "testuser1@gmail.com"}
      expect(flash[:notice]).to eq("Your change was made successfully")
      expect(response).to redirect_to(hold_path)
    end
 
    it "should show error for non-existing user" do
      get :change, params:  {:email => "s@gmail.com"}
      expect(flash[:warning]).to eq("User doesn't exist")
      expect(response).to redirect_to(hold_path)
    end   
    
    it "should show error if change can't be saved" do
      fake_user = [double("User")]
      allow(User).to receive(:find_by_email).with("s@gmail.com").and_return(fake_user[0])
      allow(fake_user[0]).to receive(:present?).and_return(true)
      allow(fake_user[0]).to receive(:in_hold).and_return(false)
      allow(fake_user[0]).to receive(:in_hold=).with(true).and_return(true)
      allow(fake_user[0]).to receive(:save).and_return(false)
      
      get :change, params:  {:email => "s@gmail.com"}
      expect(flash[:notice]).to eq("Something went wrong!!")
      expect(response).to redirect_to(hold_path)
    end  
  end  

end
