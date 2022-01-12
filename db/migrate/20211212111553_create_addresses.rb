class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :number
      t.string :street
      t.string :suburb
      t.string :postcode

      t.timestamps
    end
  end
end
