class Meeting < ApplicationRecord
    has_and_belongs_to_many :interests
    has_and_belongs_to_many :users
end
