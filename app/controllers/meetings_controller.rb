class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]
  #ONLY HAML ACTIONS IMPLEMENTED !! PARTIALS AT SPRINT 3
  def meeting_params
    params.require(:meeting).permit(:name, :approx_time, :start_time)
  end
  
  # GET /meetings
  def index
    @meetings = Meeting.all
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
    @interests = Interest.all
  end

  # GET /meetings/1/edit
  def edit
    # TO BE COMPLETED
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

  # PATCH/PUT /meetings/1
  def update
    # TO BE COMPLETED
  end

  # DELETE /meetings/1
  def destroy
    # TO BE Completed
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end
end
