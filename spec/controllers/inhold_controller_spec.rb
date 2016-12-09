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
 
   # it "change went wrong" do
    #  get :change, params:  {:email => "s@gmail.com"}
    #  expect(flash[:notice]).to eq("Something went wrong!!")
    #  expect(response).to redirect_to(hold_path)
  #  end    
  end  

end
