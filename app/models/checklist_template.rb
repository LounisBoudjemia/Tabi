class ChecklistTemplate < ApplicationRecord
  belongs_to :user
  has_many :checklist_items, as: :checklistable

  validates :name, presence: true
end
