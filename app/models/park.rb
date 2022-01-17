class Park < ApplicationRecord
  belongs_to :category
  belongs_to :feature
  belongs_to :address
  has_many :post, dependent: :destroy
  # ENSURE TESTS PASS
  belongs_to :user
  has_one_attached :picture
end
