class AddLongitudeToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :longitude, :float
  end
end
