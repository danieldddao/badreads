require 'spec_helper'
require 'rails_helper'

describe Role do
    describe 'getting position code' do
    it 'should return random code' do
      expect(Role.create_position_code).not_to be_falsey
    end
  end
end
