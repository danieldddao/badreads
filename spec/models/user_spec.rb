require 'spec_helper'
require 'rails_helper'

describe User do
    describe 'email activation' do
        fixtures :users
        it 'should update user account when successfully activated account' do
            fake_user = [double("User")]
            allow(fake_user[0]).to receive(:update_attributes).and_return(true)
            expect(User.email_activate(fake_user[0], "123456")).not_to be_falsey
        end
  end
end
