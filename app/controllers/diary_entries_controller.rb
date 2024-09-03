class DiaryEntriesController < ApplicationController
  def index
    @diary_entries = DiaryEntry.all
    @diary_entry = DiaryEntry.find(params[:trip_id])
  end

  def show
    @diary_entry = DiaryEntry.find(params[:id])
  end

  def new
    @diary_entry = DiaryEntry.new
  end

  def create
    @diary_entry = DiaryEntry.new(diary_params)
    if @diary_entry.save
      redirect_to @diary_entry, notice: 'Diary Entry was successfully created.'
    else
      render :new
    end
  end

  def edit
    @diary_entry = DiaryEntry.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def diary_params
    params.require(:diary_entries).permit(:headline, :content, :date, :trip_id)
  end
end
