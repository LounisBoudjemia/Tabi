class Trip < ApplicationRecord
  has_many :stops

  validates :name, presence: true
  validates :start_date, presence: true
end
