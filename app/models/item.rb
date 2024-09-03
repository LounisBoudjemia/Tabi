class Item < ApplicationRecord
  validates :name, presence: true
  has_many :checklist_items, as: :checklistable, dependent: :destroy

  def checklistable_type(list)
    if list.respond_to?(:trip_id)
      "Checklist"
    elsif list.respond_to?(:user_id)
      "ChecklistTemplate"
    end
  end
end
