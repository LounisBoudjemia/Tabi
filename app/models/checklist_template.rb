class ChecklistTemplate < ApplicationRecord
  belongs_to :user
  has_many :checklist_items, as: :checklistable
  has_many :items, through: :checklist_items

  validates :name, presence: true
end
