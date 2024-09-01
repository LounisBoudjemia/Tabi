class Checklist < ApplicationRecord
  belongs_to :trip
  has_many :checklist_items, as: :checklistable
  has_many :items, through: :checklist_items

  validates :name, presence: true
end
