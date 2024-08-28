class Stop < ApplicationRecord
  belongs_to :trip
  has_many :activities

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
end
