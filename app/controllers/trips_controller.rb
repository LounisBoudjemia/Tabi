class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  def index
    @trips = Trip.all
  end

  def show
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to @trip, notice: "Let's start planning!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @service = Service.find(params[:id])
  end

  def update
    # @service = Service.find(params[:id])
    if @trip.update(trip_params)
      redirect_to @trip, notice: 'Your Trip has been updated successfully.'
    else
      render :show
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path(@trip)
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :start_date, :end_date)
  end

  def set_service
    @trip = Trips.find(params[:id])
  end
end
