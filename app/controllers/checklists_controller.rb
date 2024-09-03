class ChecklistsController < ApplicationController
  def index
    @item = Item.new
    @trip = Trip.find(params[:trip_id])
    @checklists = Checklist.where(trip: @trip)
    @checklist_templates = ChecklistTemplate.where(user: current_user)
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @checklist = Checklist.find(params[:id])
    respond_to do |format|
      format.turbo_stream
      format.html # fallback if needed
    end
  end
end
