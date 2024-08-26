class CreateStops < ActiveRecord::Migration[7.1]
  def change
    create_table :stops do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.text :address
      t.float :longitude
      t.float :latitude
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
