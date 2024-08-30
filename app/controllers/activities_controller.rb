class ActivitiesController < ApplicationController
  def show
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
    @stop = Stop.find(params[:stop_id])
  end

  def create
    @stop = Stop.find(params[:stop_id])
    # @activity = Activity.new(activity_params)
    @activity = @stop.activities.new(activity_params)
    @activity.save
    redirect_to stop_path(@stop), notice: 'You added this activity successfully.'
  end

  def destroy
    @activity = Activity.find_by(id: params[:id])
    @stop = @activity.stop
    @activity.destroy
    redirect_to stop_path(@stop)
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      redirect_to stop_path(@activity.stop), notice: 'You updated this activity successfully.'
    else
      render :show
    end
  end

  def favorite
    @activity = Activity.find(params[:id])
    @stop = @activity.stop
    @activity.update(favorite: !@activity.favorite)
    redirect_to stop_path(@stop)
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :start_date, :location, :category, :description, :favorite, :stop_id)
  end
end
