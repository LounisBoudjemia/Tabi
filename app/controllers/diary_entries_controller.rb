class DiaryEntriesController < ApplicationController
  def index
    @diary_entry = DiaryEntry.find(params[:trip_id])
    @trip = Trip.find(params[:trip_id])
    @stops = @trip.stops
    @diary_entries = @trip.diary_entries
    @events = @stops + @diary_entries
    @show_diary_entry = DiaryEntry.find(params[:trip_id])
  end

  def show
    @diary_entry = DiaryEntry.find(params[:id])
  end

  def new
    @diary_entry = DiaryEntry.new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @diary_entry = DiaryEntry.new(diary_params)
    @diary_entry.trip = @trip
    @diary_entry.date = params[:date]
    @diary_entry.save
    redirect_to trip_diary_entries_path(@trip), notice: 'Diary Entry was successfully created.'
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def diary_params
    params.require(:diary_entry).permit(:headline, :content, :date, :trip_id)
  end
end
