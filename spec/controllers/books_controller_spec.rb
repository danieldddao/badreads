require 'spec_helper'
require 'rails_helper'

describe BooksController do
    describe 'indexing books - homepage' do
        fixtures :books
        it "should return top 10 searched books" do
            get :index
            expect(assigns(:top_10_searched_books).length).to eq(4)  
            expect(assigns(:top_10_searched_books)[0].title).to eq("TestBook2")     
            expect(assigns(:top_10_searched_books)[1].title).to eq("TestBook3")      
            expect(assigns(:top_10_searched_books)[2].title).to eq("TestBook4")      
            expect(assigns(:top_10_searched_books)[3].title).to eq("TestBook1")
            expect(response).to render_template('index')
        end
    end
    describe "Showing all books" do
        fixtures :books
        it "Should render the allbooks form page" do
            get :allbooks
            expect(assigns(:books).length).to eq(4)
            expect(response).to render_template('allbooks')
        end
    end
    describe "Showing selected book" do
        fixtures :books
        it "Should render the selected book page" do
            get :show, params: {:id => 1}
            expect(assigns(:book).title).to eq("TestBook1")
            expect(response).to render_template('show')
        end
        it "Should show error for incorrect request" do
            get :show, params: {:id => "fail"}
            expect(flash[:warning]).to eq("The Book you are lookling for is not in the Database!")
            expect(response).to redirect_to(books_url)
        end
    end
    describe "Add a book to the database" do
        it "Should render new template" do
            get :new
            expect(response).to render_template('new')
        end
    end
    describe "Create a book in the database" do
        it "Should call method create template" do
            post :create, params: {:book => {:isbn => '9780806539966', :title => 'Wizard: The Life and Times of Nikola Tesla : Biography of a Genius', :author => 'Seifer, Marc J.', :publisher => 'Citadel Pr', :summary => 'The story of one of the most prolific, independent, and iconoclastic inventors of this century . . . fascinating', :publication_year => '2016', :category => 'Science & Technology', :edition => 'Reprint', :search_count => 10}}
            expect(response).to redirect_to(root_path)
        end
    end
    describe "Search for a book in database" do
        fixtures :books
        it "Should render the search resulst page when searching by isbn" do
            post :search, params: { search_terms: "1234567890000"}
            expect(response).to render_template('search')
        end
        it "Should render the search resulst page when searching by title" do
            post :search, params: { search_terms: "TestBook4"}
            expect(response).to render_template('search')
        end
        it "Should render the search resulst page when searching by author" do
            post :search, params: { search_terms: "TestAuthor1"}
            expect(response).to render_template('search')
        end
        it "Should call the search count update method" do
            expect(Book).to receive(:find_by_isbn)
            expect(Book).to receive(:find_by_author)
            expect(Book).to receive(:find_by_title)
            post :search,params: {:title => "TestBook4"}
        end
    end
    describe "Delete a book in database" do
        fixtures :books
        context "Delete Form" do
            it "Should render the delete form page" do
                get :delform
                expect(response).to render_template('delform')
            end
        end
        it "Should return to homepage" do
            post :delete, params: {:book => {:title => "TestBook4", :author => "TestAuthor1"}}
            expect(response).to redirect_to(books_path)
        end
        it "Should delete the book if found" do
            controller.instance_variable_set(:@current_user, User.new(:id => 1, :position => "Staff")) 
            post :delete, params: {:book => {:title => "TestBook4", :author => "TestAuthor1"}}
            expect(Book.count).to eq(3)
            expect(response).to redirect_to(root_path)
        end
        it "Should show message if not found details" do
            controller.instance_variable_set(:@current_user, User.new(:id => 1, :position => "Staff")) 
            post :delete, params: {:book => {:title => "TestBook4", :author => ""}}
            expect(Book.count).to eq(4)
            expect( flash[:notice]).to eq("Book details didn't match")
            expect(response).to redirect_to(root_path)
        end
        it "Should show message if not found title" do
            controller.instance_variable_set(:@current_user, User.new(:id => 1, :position => "Staff")) 
            post :delete, params: {:book => {:title => "", :author => ""}}
            expect(Book.count).to eq(4)
            expect( flash[:notice]).to eq("Book title not in collection")
            expect(response).to redirect_to(root_path)
        end
    end
end