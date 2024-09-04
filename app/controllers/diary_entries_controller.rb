class DiaryEntriesController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @stops = @trip.stops
    @diary_entries = @trip.diary_entries
    @events = @stops + @diary_entries
    @show_diary_entry = DiaryEntry.find_by(date: Date.today)
    # if DiaryEntry.find_by(date: Date.today).present?
    #   @show_diary_entry = DiaryEntry.find_by(date: Date.today)
    # else
    #   @show_diary_entry = DiaryEntry.create(date: Date.today, headline: "Entry from #{Date.today}")
    # end
    @diary_entry = DiaryEntry.new
    @date = params[:date] || Date.today
  end

  def show
    @diary_entry = DiaryEntry.find(params[:id])
  end

  def new
    @trip = Trip.find(params["trip_id"])
    @show_diary_entry = DiaryEntry.find_by(date: params["date"], trip_id: @trip.id)
    @diary_entry = DiaryEntry.new
    @date = params[:date] || Date.today
    trip_start = @trip.start_date
    start_date = Date.parse(params[:date])
      loop do
        @stop = Stop.find_by(trip_id: @trip, start_date: start_date)

        break unless @stop.nil?

        start_date -= 1.day

        break if  trip_start = start_date - 1.day
      end
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @diary_entry = DiaryEntry.new(diary_params)
    @diary_entry.trip = @trip
    @diary_entry.save
    redirect_to new_trip_diary_entry_path(@trip, diary_params: :date), notice: 'Diary Entry was successfully created.'
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def diary_params
    params.require(:diary_entry).permit(:headline, :content, :date)
  end
end
