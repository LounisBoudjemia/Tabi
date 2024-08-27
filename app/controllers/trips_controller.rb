class TripsController < ApplicationControllerx
  def index
    @trips = Trip.all
  end
end
