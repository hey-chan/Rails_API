FactoryBot.define do
  factory :address do
    number { 120 }
    street { "Spencer Street" }
    suburb { "Melbourne" }
    postcode { "3000" }
  end
end
