class AddCheckedToChecklistItems < ActiveRecord::Migration[7.1]
  def change
    add_column :checklist_items, :checked, :boolean, default: false
  end
end
