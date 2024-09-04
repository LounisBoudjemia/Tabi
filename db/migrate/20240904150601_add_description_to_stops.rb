class AddDescriptionToStops < ActiveRecord::Migration[7.1]
  def change
    add_column :stops, :description, :text
  end
end
