class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_current_user
    
  def book_params
    params.require(:book).permit(:title, :isbn, :author, :summary, :publisher, :category, :publication_year, :edition)
  end
  
  def get_top_10_searched_books
    Book.order(search_count: :desc).limit(10)
  end
  
  def get_top_10_reviewed_books
  end
  
  def index
    @top_searched_books = get_top_10_searched_books
    # @top_reviewed_books = get_top_10_reviewed_books
  end

  def show
  end

  def new
    # @book = Book.new
  end

  def edit
    if !@current_user || @current_user.position == "User"
      flash[:warning]= "WARN! You don't have authority to edit book!"  
      redirect_to book_path(@book)
    end
  end

  def create
    @book = Book.create!(book_params)

    # respond_to do |format|
    #   if @book.save
    #     format.html { redirect_to @book, notice: 'Book was successfully created.' }
    #     format.json { render :show, status: :created, location: @book }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @book.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def update
  #   @book = Book.find(params[:id])
    
  #   if params[:new_title] == nil
  #     if params[:new_isbn] == nil
  #       if params[:new_author] == nil
  #         if params[:new_summary] == nil
  #           if params[:new_publisher] == nil
  #             if params[:new_publication_year] == nil
  #               if params[:new_edition] == nil
  #                 flash[:warning] = "Error! Please try again!"
  #               else
  #                 if params[:new_edition][0].empty?
  #                   flash[:warning] = "New Edition can't be empty"
  #                 else
  #                   @book.update_attributes!(:edition => params[:new_edition][0])
  #                   flash[:notice] = "Edition was successfully updated."
  #                 end
  #               end
  #             else
  #               if params[:new_publication_year][0].empty?
  #                 flash[:warning] = "New Publication Year can't be empty"
  #               else
  #                 @book.update_attributes!(:publication_year => params[:new_publication_year][0])
  #                 flash[:notice] = "Publication Year was successfully updated."
  #               end
  #             end
  #           else
  #             if params[:new_publisher][0].empty?
  #               flash[:warning] = "New Publisher can't be empty"
  #             else
  #               @book.update_attributes!(:publisher => params[:new_publisher][0])
  #               flash[:notice] = "Publisher was successfully updated."
  #             end
  #           end
  #         else
  #           if params[:new_summary][0].empty?
  #             flash[:warning] = "New Summary can't be empty"
  #           else
  #             @book.update_attributes!(:summary => params[:new_summary][0])
  #             flash[:notice] = "Summary was successfully updated."
  #           end
  #         end
  #       else
  #         if params[:new_author][0].empty?
  #           flash[:warning] = "New Author can't be empty"
  #         else
  #           @book.update_attributes!(:author => params[:new_author][0])
  #           flash[:notice] = "Author was successfully updated."
  #         end
  #       end
  #     else
  #       if params[:new_isbn][0].empty?
  #         flash[:warning] = "New ISBN can't be empty"
  #       else
  #         if Book.find_by_isbn(params[:new_isbn][0])
  #         flash[:warning] = "ISBN exists in the database"
  #         else
  #           @book.update_attributes!(:isbn => params[:new_isbn][0])
  #           flash[:notice] = "ISBN was successfully updated."
  #         end
  #       end
  #     end
  #   else
  #     if params[:new_title][0].empty?
  #       flash[:warning] = "New Title can't be empty"
  #     else
  #       @book.update_attributes!(:title => params[:new_title][0])
  #       flash[:notice] = "Title was successfully updated."
  #     end
  #   end
  #   redirect_to edit_book_path(@book)
  end

  def destroy
    # @book.destroy
    # respond_to do |format|
    #   format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end
    
  def search_book
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      if Book.where(id: params[:id]).exists?
        @book = Book.find(params[:id])
      else
        redirect_to books_path
        flash[:warning] = "The Book you are lookling for is not in the Database!"
      end
    end
end
