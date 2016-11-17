require 'spec_helper'
require 'rails_helper'

describe ReviewsController do
    describe 'creating new review' do
        fixtures :books
        fixtures :reviews
        fixtures :users
        it "should redirect to books path for unknown user" do
            post :create, params: {:id => 1}
            expect(response).to redirect_to(book_path)
        end
        it "should redirect to books path if user has already posted review" do
            controller.instance_variable_set(:@current_user, User.new(:id => 1, :position => "Staff")) 
            post :create, params: {:id => 1}
            expect(response).to redirect_to(book_path)
        end
        it "should create new review if user has not posted review" do
            controller.instance_variable_set(:@current_user, User.new(:id => 4, :position => "Staff")) 
            post :create, params: {:id => 1, :new_review_comment => "Test Comment", :rating => 3}
            expect(response).to redirect_to(book_path)
        end
        it "should show error for empty comment if user has not posted review" do
            controller.instance_variable_set(:@current_user, User.new(:id => 4, :position => "Staff")) 
            post :create, params: {:id => 1, :new_review_comment => "", :rating => 3}
            expect(response).to render_template("books/show")
        end
        it "should show error for empty rating if user has not posted review" do
            controller.instance_variable_set(:@current_user, User.new(:id => 4, :position => "Staff")) 
            post :create, params: {:id => 1, :new_review_comment => "Testing Comment"}
            expect(response).to render_template("books/show")
        end
    end
end