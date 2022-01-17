class Park < ApplicationRecord
  belongs_to :category
  belongs_to :feature
  has_one :address, dependent: :destroy
  has_many :post, dependent: :destroy
  # ENSURE TESTS PASS
  belongs_to :user
  has_one_attached :picture
end
