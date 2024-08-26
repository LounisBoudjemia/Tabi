class CreateDiaryEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :diary_entries do |t|
      t.string :headline
      t.text :content
      t.date :date
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
