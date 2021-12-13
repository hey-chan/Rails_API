class CreateParks < ActiveRecord::Migration[6.1]
  def change
    create_table :parks do |t|
      t.references :category, null: false, foreign_key: true
      t.references :feature, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true
      t.string :icon
      t.string :name
      t.string :cheese
      t.string :wine

      t.timestamps
    end
  end
end
