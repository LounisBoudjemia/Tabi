class ChecklistItem < ApplicationRecord
  belongs_to :item
  belongs_to :checklistable, polymorphic: true
end
