class Role < ActiveRecord::Base
    
    VALID_POSITION = /\A(Admin|Staff)\z/
    validates :position, presence: true,
              format: {with: VALID_POSITION}
    validates :position_code, presence: true
    
    def self.create_position_code
        SecureRandom.hex
    end
end
