class AddLatitudeToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :latitude, :float
  end
end
