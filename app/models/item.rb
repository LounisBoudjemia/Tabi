class Item < ApplicationRecord
  validates :name, presence: true
  has_many :checklist_items, as: :checklistable, dependent: :destroy
end
