class Activity < ApplicationRecord
  belongs_to :stop
  validates :name, presence: true
end
