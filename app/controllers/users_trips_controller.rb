class UsersTripsController < ApplicationController
  @user = current_user
  # select all bookings that belong to the current user
  @my_trips = Trip.all.select { |trip| trip.user_id == @user.id }
  # select all services that belong to the current user
  # select all service ids that belong to the current user
  @trip_ids = @trips.map { |trip| trip[:id] }
  # select all bookings that belong to these services
  #@my_gigs = Booking.where(service_id: @service_ids)
end
