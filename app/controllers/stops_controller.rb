class StopsController < ApplicationController
  before_action :set_stop, only: [:show, :edit, :update, :destroy]
  def index
    @stops = Stop.all
    @trip = Trip.find(params[:trip_id])
  end

  def show
    @stop = Stop.find(params[:id])
    @trip = @stop.trip
    @activities = @stop.activities.order(start_date: :asc)
    @activity_dates = @activities.map {|activity| activity.start_date}.uniq
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
    @trip = @stop.trip
  end

  # def update
  #   if @stop.update(stop_params)
  #     redirect_to trip_path(@stop.trip), notice: 'You updated this stop successfully.'
  #   else
  #     render :update
  #   end
  # end

  def update
    @trip = @stop.trip
    if @stop.update(stop_params)
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace("stop_card_#{@stop.id}", partial: "trips/stop", locals: { stop: @stop }), # Update the individual stop card
            turbo_stream.replace(:stops_map, partial: "trips/map", locals: { markers: updated_markers }) # Refresh the map with updated markers
          ]
        end
        format.html { redirect_to trip_path(@stop.trip), notice: 'You updated this stop successfully.' }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("stop_card_#{@stop.id}", partial: "trips/stop", locals: { stop: @stop }) # Show validation errors on the same stop card
        end
        format.html { render :edit }
      end
    end
  end

  def destroy
    @trip = @stop.trip
    @stop.destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.remove("stop_card_#{@stop.id}"),
          turbo_stream.replace(:stops_map, partial: "trips/map", locals: {markers: updated_markers})
        ]
      end
      format.html { redirect_to trip_path(@stop.trip), notice: 'Stop was successfully deleted.' }
    end
  end

  private

  def stop_params
    params.require(:stop).permit(:name, :start_date, :end_date, :address, :description, :trip_id)
  end

  def set_stop
    @stop = Stop.find(params[:id])
  end

  def updated_markers
    # Assuming @trip is available and it has_many :stops
    @trip.stops.map do |stop|
      { lat: stop.latitude, lng: stop.longitude, title: stop.name }
    end.to_json
  end
end
