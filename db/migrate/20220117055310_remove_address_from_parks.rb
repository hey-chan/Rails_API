class RemoveAddressFromParks < ActiveRecord::Migration[6.1]
  def change
    remove_reference :parks, :address, null: false, foreign_key: true
  end
end
