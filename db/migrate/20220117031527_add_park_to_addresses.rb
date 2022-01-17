class AddParkToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_reference :addresses, :park, null: false, foreign_key: true, optional: true
  end
end
