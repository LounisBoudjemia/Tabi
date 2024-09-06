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
    @trip = Trip.find(params["trip_id"])
    # get the template
    @checklist_template = ChecklistTemplate.find(params[:id])
    # get the items from the template
    @checklist_items = ChecklistItem.where(checklistable_type: "ChecklistTemplate", checklistable_id: params[:id])
    # create a new checklist with the same name as the template
    @checklist = Checklist.create!(trip_id: @trip.id, name: @checklist_template.name)
    # create the items in the new checklist
    @checklist_items.each do |checklist_item|
      ChecklistItem.create!(item_id: checklist_item.item_id, checklistable_type: "Checklist",
      checklistable_id: @checklist.id)
    end
    respond_to do |format|
      @checklists = Checklist.where(trip: @trip)
      format.html { redirect_to trip_checklists_path(trip_id: @trip.id) }
      format.turbo_stream do
        render turbo_stream: [
        turbo_stream.replace(:checklist_show, partial: 'shared/list',
                            locals: { list: @checklist, trip: @trip }),
        turbo_stream.replace(:checklist_menu, partial: 'checklists/checklist_menu',
                            locals: { checklists: @checklists, trip: @trip })
      ]
      end
    end
  end

  def make_template
    @user = current_user
    @trip = Trip.find(params["trip_id"])
    @checklist = Checklist.find(params[:id])
    @checklist_items = ChecklistItem.where(checklistable_type: "Checklist", checklistable_id: params[:id])
    @checklist_template = ChecklistTemplate.create!(user_id: @user.id, name: @checklist.name)
    @checklist_items.each do |checklist_item|
      ChecklistItem.create!(item_id: checklist_item.item_id, checklistable_type: "ChecklistTemplate",
                            checklistable_id: @checklist_template.id)
    end
    respond_to do |format|
      @checklist_templates = ChecklistTemplate.where(user: @user)
      format.html { redirect_to trip_checklists_path(trip_id: @trip.id) }
      format.turbo_stream do
        render turbo_stream: [
        turbo_stream.replace(:checklist_template_show, partial: 'shared/list',
                            locals: { list: @checklist_template, trip: @trip }),
        turbo_stream.replace(:checklist_template_menu, partial: 'checklist_templates/checklist_template_menu',
                            locals: { checklists: @checklist_templates, trip: @trip })

      ]
      end
    end
  end
end
