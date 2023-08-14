class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.date :date
      t.integer :body_temperature
      t.integer :weight
      t.integer :body_fat_percentage
      t.string :condition
      t.text :memo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
