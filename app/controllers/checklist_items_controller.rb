class ChecklistItemsController < ApplicationController
  def show
    @checklist_item = ChecklistItem.find(params[:id])
  end

  def checked
    @checklist_item = ChecklistItem.find(params[:id])
    @checklist_item.update(checked: !@checklist_item.checked)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("checklist_item_checked_#{@checklist_item.id}",
                               partial: "shared/checked",
                               locals: { checklist_item: @checklist_item, trip: @trip }
          )
        ]
      end
      format.html do
        @trip = Trip.find(params[:trip_id])
        redirect_to trip_checklists_path(@trip), notice: 'You updated this item successfully.'
      end
    end
  end

  def use_template
    # @checklist_template = ChecklistTemplate.find(params[:id])
    @checklist = Checklist.find_by(trip_id: params[:trip_id])
    @checklist_items = ChecklistItem.where(checklistable_type: "ChecklistTemplate", checklistable_id: params[:id])
    @checklist_items.each do |checklist_item|
      ChecklistItem.create!(item_id: checklist_item.item_id, checklistable_type: "Checklist",
                            checklistable_id: @checklist.id)
    end
  end
end
