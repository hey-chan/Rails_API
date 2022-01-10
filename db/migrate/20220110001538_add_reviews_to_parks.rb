class AddReviewsToParks < ActiveRecord::Migration[6.1]
  def change
    add_column :parks, :reviews, :text, array: true, default: []
  end
end
