class Park < ApplicationRecord
  belongs_to :category
  has_many :feature
  has_one :address
end
