require 'spec_helper'
require 'rails_helper'

describe BooksController do
    describe "Add a book to the database" do
        it "Should render new template" do
            get :new
            expect(response).to render_template('new')
        end
    end
    describe "Create a book in the database" do
        it "Should call method create template" do
            post :create, {:book => {:isbn => '9780806539966', :title => 'Wizard: The Life and Times of Nikola Tesla : Biography of a Genius', :author => 'Seifer, Marc J.', :publisher => 'Citadel Pr', :summary => 'The story of one of the most prolific, independent, and iconoclastic inventors of this century . . . fascinating', :publication_year => '2016', :category => 'Science & Technology', :edition => 'Reprint', :search_count => 10}}
            expect(response).to redirect_to(root_path)
        end
    end
    describe "Search for a book in database" do
        fixtures :books
        it "Should render the search resulst page" do
            post :search, params: { search_terms: "TestBook4"}
            expect(response).to render_template('search')
        end
        
        it "Should call the search count update method" do
            expect(Book).to receive(:find_by_isbn)
            expect(Book).to receive(:find_by_author)
            expect(Book).to receive(:find_by_title)
            post :search, {:title => "TestBook4"}
        end
    end
    describe "Delete a book in database" do
        fixtures :books
        it "Should render the delete form page" do
            get :delform
            expect(response).to render_template('delform')
        end
        
    end
end