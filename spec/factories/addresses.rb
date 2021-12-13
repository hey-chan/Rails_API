FactoryBot.define do
  factory :address do
    number { 1 }
    street { "MyString" }
    suburb { "MyString" }
    postcode { "MyString" }
  end
end
