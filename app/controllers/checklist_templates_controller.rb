class ChecklistTemplatesController < ApplicationController
  def new
    @trip = Trip.find(params[:trip_id])
    @checklist_template = ChecklistTemplate.new
  end

  def create
    @trip = Trip.find(params["trip_id"])
    @checklist_template = ChecklistTemplate.new(name: params[:checklist_template][:name], user_id: current_user.id)

    respond_to do |format|
      if @checklist_template.save
        @checklist_templates = ChecklistTemplate.where(user: current_user)
          format.html { redirect_to trip_checklists_path(trip_id: @trip.id) }
          format.turbo_stream do
            render turbo_stream: [
          turbo_stream.replace(:checklist_template_show, partial: 'shared/list',
                              locals: { list: @checklist_template, trip: @trip }),
          turbo_stream.replace(:checklists_header, partial: 'checklists/checklists_header')
          ]
          end
      else
        format.html { render :new }
        format.turbo_stream { render :new }
      end
    end
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @checklist_template = ChecklistTemplate.find(params[:id])
  end

  def edit
    @trip = Trip.find(params["trip"])
    @checklist_template = ChecklistTemplate.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:trip_id])
    @checklist_template = ChecklistTemplate.find(params[:id])
    if @checklist_template.update(checklist_template_params)
      redirect_to trip_checklists_path(trip_id: @trip.id)
    else
      render :edit
    end
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
        @checklist_templates = ChecklistTemplate.where(user: current_user)
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

  private

  def checklist_template_params
    params.require(:checklist_template).permit(:name)
  end
end
