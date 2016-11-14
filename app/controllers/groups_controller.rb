class GroupsController < ApplicationController
    before_action :set_current_user

    def view_calendar
        #render simple calendar
        @meetings = Meeting.all
    end

end
