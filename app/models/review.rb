class Review < ActiveRecord::Base
    belongs_to :book
    belongs_to :user
    validates :star, presence: true
    validates :comment, presence: true

end
