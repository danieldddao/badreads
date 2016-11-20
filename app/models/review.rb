class Review < ActiveRecord::Base
    belongs_to :book
    belongs_to :user
    validates :star, presence: true
    validates :comment, presence: true
    after_save :update_review_count

    private
        def update_review_count
            book = Book.find(self.book_id)
            book.reviews_count = book.reviews.count
            book.save
        end
end