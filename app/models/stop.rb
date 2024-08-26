class Stop < ApplicationRecord
  belongs_to :trip
  has_many :activities

  validates :name, presence: true
end
