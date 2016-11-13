class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def set_current_user
    @current_user ||= session[:session_token ] && User.find_by_session_token(session[:session_token])
  end

  def current_user?(id)
    @current_user.id.to_s == id
  end  
  
  def checkBookExist
    if Book.exists?(params[:id])
      @book = Book.find(params[:id])
    else
      flash[:warning] = "The Book you are looking for is not in the Database!"
      redirect_to root_path
    end
  end
  
  def check_book_reviews
    if @book
      @current_user_has_review = false
      @current_user_review = nil
      @top_reviews = nil
      @avg_rating = 0
      if @current_user && !@book.reviews.empty?
        @book.reviews.each {|review| 
          if review.user.id == @current_user.id
            @current_user_has_review = true 
            @current_user_review = review
          end
        }
      end
      @top_reviews = @book.reviews.order('star DESC').limit(3)
      
      # Calculate Average Rating
      if !@book.reviews.empty?
        @book.reviews.each {|review| 
          @avg_rating += review.star
        }
        @avg_rating = (@avg_rating.to_f / @book.reviews.count.to_f).round
      end
    end
  end
end
