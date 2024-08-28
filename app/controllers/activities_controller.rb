class ActivitiesController < ApplicationController
  def show
    @activities = Activity.all
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.save
  end

  # def destroy
  #   @stop =
  #   @activity.destroy
  #   redirect_to activities_path(@activity)
  # end

  def new
    @activity = Activity.new
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      redirect_to @activity, notice: 'You updated this activity successfully.'
    else
      render :show
    end
    end
  end


  private

  def activity_params
    params.require(:activity).permit(:name, :start_date, :end_date,:address, :trip_id)
  end
end
