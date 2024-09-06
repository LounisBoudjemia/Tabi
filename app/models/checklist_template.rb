class ChecklistTemplate < ApplicationRecord
  belongs_to :user
  has_many :checklist_items, as: :checklistable
  has_many :items, through: :checklist_items

  validates :name, presence: true

  def separate_checked_and_unchecked_items
    # Eager load the associated checklist items and items to reduce database queries.
    checklist_items_with_items = checklist_items.includes(:item)

    unchecked_items = []
    checked_items = []

    # Separate items based on the checked attribute
    checklist_items_with_items.each do |checklist_item|
      if checklist_item.checked
        checked_items << checklist_item.item
      else
        unchecked_items << checklist_item.item
      end
    end

    [unchecked_items, checked_items]
  end

  def list_type?
    "checklist_template"
  end
end
