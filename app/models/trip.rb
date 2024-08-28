class Trip < ApplicationRecord
  has_one_attached :photo
  has_many :stops
  has_many :checklists

  validates :name, presence: true
  validates :start_date, presence: true
end
