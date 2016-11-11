class ReviewsController < ApplicationController
  before_action :set_current_user

  private def checkBookExist
    if Book.exists?(params[:id])
      @book = Book.find(params[:id])
    else
      flash[:warning] = "The Book doesn't exist!"
      redirect_to allbooks_path
    end
  end
  
  def create
    checkBookExist
    current_user_has_review = false
    if @current_user && !@book.users.empty?
      @book.users.each {|user| current_user_has_review = true if user.id = @current_user.id}
    end
    
    @book = Book.find(params[:id])
    if @current_user
      if !current_user_has_review
        @review = @book.reviews.build(:comment => params[:new_review_comment], :star => params[:rating])
        @current_user.reviews << @review
        flash[:notice] = "Your Review for '#{@book.title}' successfully submitted!"
        redirect_to book_path(@book)
      else
        flash[:warning] = "You already posted review for this book!"
        redirect_to book_path(@book)
      end
    else
       flash[:warning] = "Please Log-in to post review!"
       redirect_to book_path(@book)
    end
  end

end
