class TripsController < ApplicationController
  before_action :authenticate_user!, :set_trip, only: [:show, :edit, :update, :destroy]
  def index
    @trip = Trip.new
    @trips = Trip.all.order(start_date: :asc)
    @upcoming_trips = @trips.partition { |trip| trip.start_date > Date.today }[0]
    @old_trips = @trips.partition { |trip| trip.end_date < Date.today }[0].sort {|trip| trip.start_date}
  end

  def show
    # @stop = Stop.new
    @stops = @trip.stops.order(start_date: :asc)
    @markers = @stops.geocoded.map do |stop|
      {
        lat: stop.latitude,
        lng: stop.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {stop: stop}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @user = current_user
    @trip.user = @user
    if @trip.save
      redirect_to @trip, notice: "Let's fucking plan a fucking trip!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to @trip, notice: 'You updated your Trip successfully.'
    else
      render :show
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :start_date, :end_date, :photo)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
