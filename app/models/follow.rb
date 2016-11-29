class Follow < ActiveRecord::Base
    belongs_to :follower, class_name: "User"
    belongs_to :followedUser, class_name: "User"
    
    validates :follower_id, presence: true
    validates :followedUser_id, presence: true

    def self.has_current_user_followed_this_user(current_user, this_user)
        followings = current_user.followings
        if !followings.empty?
            followings.each { |following| 
                return true if following.followedUser.id == this_user.id
            }
        end
        return false
    end

    
end