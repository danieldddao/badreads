class User < ActiveRecord::Base
    has_many :reviews, dependent: :destroy
    has_many :books, :through => :reviews
    has_and_belongs_to_many :interests
    has_and_belongs_to_many :meetings
    has_many :followings, class_name: "Follow", foreign_key: "follower_id"
    has_many :followers, class_name: "Follow", foreign_key: "followedUser_id"

    before_create :confirmation_token

    has_secure_password
    before_save {|user| user.email=user.email.downcase}
    before_save :create_session_token
    validates :first_name, presence: true, length: {maximum: 50}
    validates :last_name, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
    validates :password, presence: true, length: {minimum: 6}
    validates :password_confirmation, presence: true

    private
    def create_session_token
        self.session_token = SecureRandom.urlsafe_base64
    end
    def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
    def self.email_activate(user, password)
      user.update_attributes(:email_confirmed => true, :confirm_token => "", :password => password, :password_confirmation => password)
    end
    
end
