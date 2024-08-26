class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.date :start_date
      t.string :category
      t.text :description
      t.boolean :favorite

      t.timestamps
    end
  end
end
