class Activity < ApplicationRecord
  belongs_to :stop
  validates :name, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
