class ActivitiesController < ApplicationController
  def show
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
    @stop = Stop.find(params[:stop_id])
  end

  def create
    @stop = Activity.find(params[:stop_id])
    @activity = Activity.new(activity_params)
    @activity.save
    redirect_to stop_path(@stop), notice: 'You updated this activity successfully.'
  end

  def destroy
    @stop = Activity.find(params[:stop_id])
    @activity.destroy
    redirect_to stop_path(@stop)
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    if @activity.update(activity_params)
      redirect_to stop_path(@stop), notice: 'You updated this activity successfully.'
    else
      render :show
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :start_date, :category, :description, :favorite, :stop_id)
  end
end
