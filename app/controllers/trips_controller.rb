class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  def index
    @trips = Trip.all
  end

  def show

  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
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
    @service.destroy
    redirect_to services_path(@service)
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :start_date, :end_date, :photo)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
