class DiaryEntry < ApplicationRecord
  belongs_to :trip

  validates :headline, presence: true
  validates :content, presence: true

  def start_date
    self.date
  end

  def name
    self.headline
  end
end
