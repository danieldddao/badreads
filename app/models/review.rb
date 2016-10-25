class Review < ApplicationRecord::Base
    belong_to :book
    belong_to :user
end
