class Address < ApplicationRecord
  # belongs_to :park
  has_one :park
end
