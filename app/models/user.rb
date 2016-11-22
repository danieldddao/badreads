class User < ActiveRecord::Base
    has_many :reviews, dependent: :destroy
    has_many :books, :through => :reviews
    has_and_belongs_to_many :interests
    has_many :follows, dependent: :destroy
    
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
    
end
