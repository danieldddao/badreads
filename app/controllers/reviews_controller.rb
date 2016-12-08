class ReviewsController < ApplicationController
  before_action :set_current_user
  
  def create
    checkBookExist
    check_book_reviews
    
    if @current_user
      if !@current_user_has_review 
        @review = @book.reviews.new(:comment => params[:new_review_comment], :star => params[:rating])
        @current_user.reviews << @review
        if @review.save
          flash[:notice] = "Your Review for '#{@book.title}' successfully submitted!"
          redirect_to book_path(@book)
        else
          render 'books/show'
        end
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
