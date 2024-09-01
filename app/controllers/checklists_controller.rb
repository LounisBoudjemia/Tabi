class ChecklistsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @checklists = Checklist.where(trip: @trip)
    @checklist_templates = ChecklistTemplate.where(user: current_user)
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @checklist = Checklist.find(params[:id])
  end
end
