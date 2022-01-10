class Park < ApplicationRecord
  belongs_to :category
  belongs_to :feature
  belongs_to :address
  has_many :post
  # ENSURE TESTS PASS
  has_many :user
end
