class StopsController < ApplicationController
  before_action :set_stop, only: [:show, :edit, :update, :destroy]
  def index
    @stops = Stop.all
    @trip = Trip.find(params[:trip_id])
  end

  def show
    @stop = Stop.find(params[:id])
    @trip = @stop.trip
    @activities = @stop.activities.order(created_at: :asc)
    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        info_window_html: render_to_string(partial: "activity_info_window", locals: {activity: activity}),
        marker_html: render_to_string(partial: "activity_marker")
      }
    end
    # @activity = Activity.new
  end

  def new
    @stop = Stop.new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @stop = Stop.new(stop_params)
    @stop.trip = @trip
    if @stop.save
      redirect_to trip_path(@trip), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @stop = Stop.find(params[:id])
  end

  def update
    if @stop.update(stop_params)
      redirect_to @stop, notice: 'You updated this stop successfully.'
    else
      render :show
    end
  end

  def destroy
    @stop.destroy
    redirect_to trip_path
  end

  private

  def stop_params
    params.require(:stop).permit(:name, :start_date, :end_date, :address, :trip_id)
  end

  def set_stop
    @stop = Stop.find(params[:id])
  end
end
