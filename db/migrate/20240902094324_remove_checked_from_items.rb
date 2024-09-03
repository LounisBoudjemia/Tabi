class RemoveCheckedFromItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :items, :checked, :boolean
  end
end
