class Park < ApplicationRecord
  belongs_to :category
  belongs_to :feature
  has_one :address
  has_many :post
end
