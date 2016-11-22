class Follow < ActiveRecord::Base
    belongs_to :user
    validates :follower_id, presence: true
    validates :user_id, presence: true

    def self.has_current_user_followed_this_user(current_user_id, this_user_id)
        follows = Follow.where(:follower_id => current_user_id)
        if !follows.empty?
            follows.each { |follow| 
                return true if follow.user_id == this_user_id
            }
        end
        return false
    end

end