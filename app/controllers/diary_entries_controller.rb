class DiaryEntriesController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @stops = @trip.stops
    @diary_entries = @trip.diary_entries
    @diary_entry = @diary_entries.first
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
    @diary_entry = DiaryEntry.new
    @trip = Trip.find(params[:trip_id])
    @date = params[:date] || Date.today
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @diary_entry = DiaryEntry.new(diary_params)
    @diary_entry.trip = @trip
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
    params.require(:diary_entry).permit(:headline, :content, :date)
  end
end
