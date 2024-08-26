class DiaryEntry < ApplicationRecord
  belongs_to :trip

  validates :headline, presence: true
  validates :content, presence: true
end
