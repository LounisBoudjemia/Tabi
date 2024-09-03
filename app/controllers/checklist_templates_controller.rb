class ChecklistTemplatesController < ApplicationController
  def new
    @trip = Trip.find(params[:trip_id])
    # @user = current_user
    @checklist_template = ChecklistTemplate.new
  end

  def create
    @trip = Trip.find(params["trip_id"])
    @checklist_template = ChecklistTemplate.new(name: params[:checklist_template][:name], user_id: current_user.id)

    if @checklist_template.save
      redirect_to trip_checklists_path(trip_id: @trip.id)
    else
      render :new
    end
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @checklist_template = ChecklistTemplate.find(params[:id])
  end

  def destroy
    @trip = Trip.find(params[:trip])
    @checklist_template = ChecklistTemplate.find_by(id: params[:id])
    @checklist_items = ChecklistItem.where(checklistable_type: "ChecklistTemplate", checklistable_id: @checklist_template.id)

    @checklist_items.each do |checklist_item|
      item = Item.find(checklist_item.item_id)
      checklist_item.destroy
      item.destroy if ChecklistItem.where(item_id: item.id).empty?
    end

    respond_to do |format|
      if @checklist_template.destroy
        format.html { redirect_to trip_checklists_path(trip_id: @trip.id) }
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(:template_container, partial: 'checklist_templates/template_container',
                                                    locals: { checklist_templates: ChecklistTemplate.all, trip: @trip })
        end
      else
        format.html { render :new }
        format.turbo_stream { render :new }
      end
    end
  end
end
