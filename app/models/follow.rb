class Follow < ActiveRecord::Base
    belongs_to :user
    validates :follower_id, presence: true
    validates :user_id, presence: true

end