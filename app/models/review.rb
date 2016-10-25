class Review < ActiveRecord::Base
    belong_to :book
    belong_to :user
    
end
