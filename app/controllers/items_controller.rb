class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to trip_checklists_path(@trip), notice: 'You updated this item successfully.'
    else
      redirect_to trip_checklists_path(@trip), notice: 'Updating this item failed. Try again!'
    end
  end

  def destroy
    @item = Item.find_by(id: params[:id])
    # @stop = @item.stop
    @item.destroy
    # redirect_to checklists_path(@trip)
  end

  private

  def item_params
    params.permit(:id, :name, :checked)
  end
end
