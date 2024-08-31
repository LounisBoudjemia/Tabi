class ChecklistsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @checklist = Checklist.find_by_trip_id(params[:trip_id])
    @checklist_templates = ChecklistTemplate.find_by_user_id(current_user.id)
    raise
  end
end
