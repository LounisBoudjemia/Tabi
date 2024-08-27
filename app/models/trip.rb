class Trip < ApplicationRecord
  has_many :stops
  has_many :checklists
  has_one_attached :photo

  validates :name, presence: true
  validates :start_date, presence: true
end
