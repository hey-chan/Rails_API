class Park < ApplicationRecord
  belongs_to :category
  belongs_to :feature
  belongs_to :address
end
