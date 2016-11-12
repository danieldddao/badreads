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
    checkBookExist
    check_book_reviews
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
      @books = Book.all.order('search_count DESC').limit(10)
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
        flash[:warning] = 'Cannot delete!!'
        redirect_to root_path
      end
  end
  
  # Delete a book
  def destroy
    if @current_user && (@current_user.position == "Admin" || @current_user.position == "Staff")
      checkBookExist
      @book.destroy
      flash[:notice] = "Book '#{@book.title}' deleted."
      redirect_to root_path
    else
      flash[:warning] = "You don't have rights to delete this book"
      redirect_to root_path
    end
  end
  
  # Show page for editting books
  def edit
    checkBookExist
    if !@current_user || @current_user.position == "User"
      flash[:warning]= "WARN! You don't have authority to edit book!"  
      redirect_to book_path(@book)
    end
  end
  
  def update
    checkBookExist
    
    if params[:new_title] == nil
      if params[:new_isbn] == nil
        if params[:new_author] == nil
          if params[:new_summary] == nil
            if params[:new_publisher] == nil
              if params[:new_publication_year] == nil
                if params[:new_edition] == nil
                  flash[:warning] = "Error! Please try again!"
                else
                  if params[:new_edition][0].empty?
                    flash[:warning] = "New Edition can't be empty"
                  else
                    @book.update_attributes!(:edition => params[:new_edition][0])
                    flash[:notice] = "Edition was successfully updated."
                  end
                end
              else
                if params[:new_publication_year][0].empty?
                  flash[:warning] = "New Publication Year can't be empty"
                else
                  @book.update_attributes!(:publication_year => params[:new_publication_year][0])
                  flash[:notice] = "Publication Year was successfully updated."
                end
              end
            else
              if params[:new_publisher][0].empty?
                flash[:warning] = "New Publisher can't be empty"
              else
                @book.update_attributes!(:publisher => params[:new_publisher][0])
                flash[:notice] = "Publisher was successfully updated."
              end
            end
          else
            if params[:new_summary][0].empty?
              flash[:warning] = "New Summary can't be empty"
            else
              @book.update_attributes!(:summary => params[:new_summary][0])
              flash[:notice] = "Summary was successfully updated."
            end
          end
        else
          if params[:new_author][0].empty?
            flash[:warning] = "New Author can't be empty"
          else
            @book.update_attributes!(:author => params[:new_author][0])
            flash[:notice] = "Author was successfully updated."
          end
        end
      else
        if params[:new_isbn][0].empty?
          flash[:warning] = "New ISBN can't be empty"
        else
          if Book.find_by_isbn(params[:new_isbn][0])
          flash[:warning] = "ISBN exists in the database"
          else
            @book.update_attributes!(:isbn => params[:new_isbn][0])
            flash[:notice] = "ISBN was successfully updated."
          end
        end
      end
    else
      if params[:new_title][0].empty?
        flash[:warning] = "New Title can't be empty"
      else
        @book.update_attributes!(:title => params[:new_title][0])
        flash[:notice] = "Title was successfully updated."
      end
    end
    redirect_to edit_book_path(@book)
  end

end
