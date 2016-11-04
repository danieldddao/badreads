class RolesController < ApplicationController
  before_action :set_current_user

  def new
    @roles = Role.all.order(:position)
  end

  def create
    @new_position = Role.new(:position => params[:role][:position], :position_code => Role.create_position_code)
    if @new_position.save
      flash[:notice] = "New #{params[:role][:position]} added successfuly! Position Code is '#{@new_position.position_code}'"
      redirect_to new_staff_admin_path
    else
      render 'new'
    end
  end

end
