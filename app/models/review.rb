class Review < ActiveRecord::Base
    belongs_to :book
    belongs_to :user
    # after_save :update_review_count
    validates :star, presence: true
    validates :comment, presence: true

    # private
    # def update_review_count
    #     puts "Update review"
    #     puts self.book_id
    #     book = Book.find(self.book_id)
    #     puts book.reviews.count
    #     book.reviews_count = book.reviews.count
    #     book.save
    # end
end
