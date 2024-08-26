class CreateChecklistItems < ActiveRecord::Migration[7.1]
  def change
    create_table :checklist_items do |t|
      t.references :item, null: false, foreign_key: true
      t.references :checklistable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
