class ChecklistsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @checklists = Checklist.all
    @checklist_teamplates = ChecklistTemplate.all
  end
end
