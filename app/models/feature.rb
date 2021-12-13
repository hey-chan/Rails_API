class Feature < ApplicationRecord
  # Rails console does not generate Features array when relation between Park and Feature has a 'belongs_to :park'
  has_many :park
end
