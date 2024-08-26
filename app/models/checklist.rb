class Checklist < ApplicationRecord
  belongs_to :trip
  has many :checklist_items, as: :checklistable

  validates :name, presence: true
end
