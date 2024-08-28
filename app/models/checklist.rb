class Checklist < ApplicationRecord
  belongs_to :trip
  has_many :checklist_items, as: :checklistable

  validates :name, presence: true
end
