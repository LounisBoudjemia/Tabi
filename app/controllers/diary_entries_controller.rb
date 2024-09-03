class DiaryEntriesController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @stops = @trip.stops
    @diary_entries = @trip.diary_entries
    @diary_entry = @diary_entries.first
    @events = @stops + @diary_entries
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
    @diary_entry = DiaryEntry.find(params[:id])

  end

  def update
    @diary_entry = DiaryEntry.find(params[:id])
    if @diary_entry.update(diary_params)
      redirect_to trip_diary_entries_path(@diary_entry.trip), notice: 'Diary Entry was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @diary_entry = DiaryEntry.find(params[:id])
    @trip = @diary_entry.trip
    @diary_entry.destroy
    redirect_to trip_diary_entries_path(@trip), notice: 'Diary Entry was successfully deleted.'
  end

  private

  def diary_params
    params.require(:diary_entry).permit(:headline, :content, :date, :trip_id)
  end
end
