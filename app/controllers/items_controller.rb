class ItemsController < ApplicationController
  def new
    @item = Item.new
    @trip = Trip.find(params["trip"])
    if params["checklist_template_id"].present?
      @list = ChecklistTemplate.find(params[:checklist_template_id])
    elsif params["checklist_id"].present?
      @list = Checklist.find(params[:checklist_id])
    end
  end

  def create
    @trip = Trip.find(params["trip_id"])
    @item = Item.new(name: params[:item][:name])
    if params["checklist_template_id"].present?
      @list = ChecklistTemplate.find(params[:checklist_template_id])
    elsif params["checklist_id"].present?
      @list = Checklist.find(params[:checklist_id])
    end

    if @item.save
      ChecklistItem.create(item: @item, checklistable: @list)
      redirect_to trip_checklists_path(trip_id: @trip.id)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find_by(id: params[:id])
    @checklist_item = ChecklistItem.find_by(item_id: @item.id, checklistable_type: params[:checklistable_type], checklistable_id: params[:checklistable_id])

    if @checklist_item
      @checklist_item.destroy
      # find references for this item
      @checklist_items = ChecklistItem.where(item_id: @item.id)
      # destroy item if no references
      @item.destroy if @checklist_items.empty?

      respond_to do |format|
        format.html { redirect_to "/trips/#{params[:trip_id]}/checklists" }
        format.turbo_stream { render turbo_stream: turbo_stream.remove("item_#{params[:checklistable_type]}_#{params[:id]}") }
      end
    else
      # Handle item not found or destruction failure
      redirect_to "/trips/#{params[:trip_id]}/checklists", alert: 'Item could not be found'
    end
  end

  private

  def item_params
    params.permit(:id, :name, :list)
  end
end
