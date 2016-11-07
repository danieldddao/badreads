class BooksController < ApplicationController
  before_action :set_current_user
    
  def book_params
    params.require(:book).permit(:isbn, :title, :author, :publisher, :summary, :publication_year, :category, :edition, :search_count)
  end
  
  def delete_params
      params.require(:book).permit(:title, :author)
  end

  def index
    @top_10_searched_books = top_10_searched_books
  end
  
  def new
      #render new book form
  end
  
  def allbooks
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def create
    #create new book entry
    @books = Book.create!(book_params)
    @books.search_count = 0
    @books.save
    flash[:notice] = "#{@books.title} was successfully added."
    redirect_to root_path
  end
  
  def search
    #Search for book based on form submission, render results page
    #Find by ISBN:
    @books_isbn = Book.find_by_isbn(params[:search_terms])
    if !(@books_isbn)
        @books_isbn = "No Books found!"
    else
        Book.update_search_count(@books_isbn)
    end
    #Find by Title:
    @books_title = Book.find_by_title(params[:search_terms])
    if !(@books_title)
        @books_title = "No Books found!"
    else
        Book.update_search_count(@books_title)
    end
    #Find by Author:
    @books_author = Book.find_by_author(params[:search_terms])
    if !(@books_author)
        @books_author = "No Books found!"
    else
        Book.update_search_count(@books_author)
    end
  end
    
  def top_10_searched_books
      #Display top ten searched books
      @books = Book.all.order('search_count DESC')
  end
  
  def delform
      #Display form to delete a book
  end
    
  def delete
      #Delete a book here
      if @current_user && (@current_user.position == "Admin" || @current_user.position == "Staff")
        @books = Book.find_by_title(delete_params[:title])
        if @books != nil then
            if @books.author == delete_params[:author]
                Book.destroy(@books.id)
                flash[:notice] = "Book '#{@books.title}' deleted."
                redirect_to root_path
            else
                flash[:notice] = "Book details didn't match"
                redirect_to root_path
            end
        else
            flash[:notice] = "Book title not in collection"
            redirect_to root_path
        end
      else
        flash[:error] = 'Cannot delete!!'
        redirect_to books_path
      end
      
  end
  
end
