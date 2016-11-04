require 'spec_helper'
require 'rails_helper'

describe BooksController do
    describe 'setting books' do
        fixtures :books
        it "should showing error for not found book" do
            get :edit, params: {:id => 0}
            expect(flash[:warning]).to eq("The Book you are lookling for is not in the Database!")
            expect(response).to redirect_to(books_path)
        end
    end
    
    describe 'indexing books - homepage' do
        fixtures :books
        it "should return top 10 searched books" do
            get :index
            expect(assigns(:top_searched_books).length).to eq(4)  
            expect(assigns(:top_searched_books)[0].title).to eq("TestBook2")     
            expect(assigns(:top_searched_books)[1].title).to eq("TestBook3")      
            expect(assigns(:top_searched_books)[2].title).to eq("TestBook4")      
            expect(assigns(:top_searched_books)[3].title).to eq("TestBook1")
            expect(response).to render_template('index')
        end
    end
    
    describe 'editing books' do
        it "should render template for current staff" do
            controller.instance_variable_set(:@current_user, User.new(:position => "Staff")) 
            get :edit, params: {:id => 1}
            expect(response).to render_template('edit')
        end
        it "should render template for current admin" do
            controller.instance_variable_set(:@current_user, User.new(:position => "Admin")) 
            get :edit, params: {:id => 1}
            expect(response).to render_template('edit')
        end
        it "should redirect to book for normal user" do
            controller.instance_variable_set(:@current_user, User.new(:position => "User")) 
            get :edit, params: {:id => 1}
            expect(flash[:warning]).to eq("WARN! You don't have authority to edit book!")
            expect(response).to redirect_to(book_path)
        end
        it "should redirect to book for unknown user" do
            get :edit, params: {:id => 1}
            expect(flash[:warning]).to eq("WARN! You don't have authority to edit book!")
            expect(response).to redirect_to(book_path)
        end
    end
    
    describe 'creating books' do
        fixtures :books
        it 'should create new movie in the database and redirect to homepage' do
            post :create, params: {:book => {:title => "new test book", :isbn => "12345", :author => "new author", :summary => "Summary", :publisher => "new publisher", :category => "Cat1", :publication_year => "2010", :edition => "1"}}
            new_book = Book.last
            expect(Book.count).to eq(5)
            expect(new_book.title).to eq("new test book")
            expect(new_book.isbn).to eq("12345")
            expect(new_book.author).to eq("new author")
            expect(new_book.summary).to eq("Summary")
            expect(new_book.category).to eq("Cat1")
            expect(new_book.publisher).to eq("new publisher")
            expect(new_book.publication_year).to eq(2010)
            expect(new_book.edition).to eq("1")
    end
    end
end
