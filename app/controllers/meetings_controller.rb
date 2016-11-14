class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:destroy]
  #ONLY HAML ACTIONS IMPLEMENTED !! PARTIALS AT SPRINT 3
  def meeting_params
    params.require(:meeting).permit(:name, :approx_time, :start_time)
  end
  
  # GET /meetings
  def index
    @meetings = Meeting.all
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
    @interests = Interest.all
  end


  # POST /meetings
  def create
    @choices = params["selected_groups"]
    if @choices == nil then
      flash[:notice] = "No Interest Groups Were Selected"
    else
      @meeting = Meeting.create!(meeting_params)
      @choices.each do |key, value|
        if value == "1" then
          @group = Interest.find(key)
          @group.meetings << @meeting
          @meeting.interests << @group
        end
      end
      flash[:notice] = "Meeting was added to the Calendar"
    end
    redirect_to view_calendar_path
  end


  # DELETE /meetings/1
  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    @meeting = Meeting.all
    redirect_to view_calendar_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

end
