class ChecklistsController < ApplicationController
  def index
    @item = Item.new
    @trip = Trip.find(params[:trip_id])
    @checklists = Checklist.where(trip: @trip)
    @checklist_templates = ChecklistTemplate.where(user: current_user)
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @checklist = Checklist.new
  end

  def create
    @trip = Trip.find(params["trip_id"])
    @checklist = Checklist.new(name: params[:checklist][:name], trip_id: @trip.id)

    if @checklist.save
      redirect_to trip_checklists_path(trip_id: @trip.id)
    else
      render :new
    end
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @checklist = Checklist.find(params[:id])
    respond_to do |format|
      format.turbo_stream
      format.html # fallback if needed
    end
  end

  def destroy
    @trip = Trip.find(params[:trip])
    @checklist = Checklist.find_by(id: params[:id])
    @checklist_items = ChecklistItem.where(checklistable_type: "Checklist", checklistable_id: @checklist.id)

    @checklist_items.each do |checklist_item|
      item = Item.find(checklist_item.item_id)
      checklist_item.destroy
      item.destroy if ChecklistItem.where(item_id: item.id).empty?
    end

    respond_to do |format|
      if @checklist.destroy
        format.html { redirect_to trip_checklists_path(trip_id: @trip.id) }
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(:checklist_container, partial: 'checklists/checklist_container',
                                                    locals: { checklists: Checklist.all, trip: @trip })
        end
      else
        format.html { render :new }
        format.turbo_stream { render :new }
      end
    end
  end
end
