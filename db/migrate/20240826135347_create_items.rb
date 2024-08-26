class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.boolean :checked

      t.timestamps
    end
  end
end
