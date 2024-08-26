class AddStopToActivities < ActiveRecord::Migration[7.1]
  def change
    add_reference :activities, :stop, null: false, foreign_key: true
  end
end
