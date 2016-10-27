class Book < ActiveRecord::Base
    has_many :reviews
    has_many :users, :through => :reviews
    
    validates :isbn, presence: true
    validates :title, presence: true
    validates :author, presence: true
    validates :publication_year, presence: true
    validates :category, presence: true
    validates :edition, presence: true

end
