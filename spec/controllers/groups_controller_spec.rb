require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
    describe 'Calendar View' do
        fixtures :meetings
        fixtures :interests
        it 'should render the calendar view' do
            get :view_calendar
          expect(response).to render_template("view_calendar")
        end
    end
end
