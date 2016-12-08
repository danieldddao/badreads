class Book < ActiveRecord::Base
    has_many :reviews
    has_many :users, :through => :reviews
    
    validates :isbn, presence: true, length: {minimum:10, maximum: 13}
    validates :title, presence: true
    validates :author, presence: true
    VALID_YEAR = /\A(1|2)[0-9]{3}\z/i
    validates :publication_year, presence: true, length: {maximum: 4}, format: {with: VALID_YEAR}
    validates :category, presence: true
    validates :edition, presence: true
    
    def self.update_search_count(book_object)
      x = book_object.search_count
      x = x + 1
      book_object.search_count = x
      book_object.save
    end
end
