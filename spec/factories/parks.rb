FactoryBot.define do
  factory :park do
    association :category
    association :feature
    # association :address
    # category_id { 2 }
    # feature_id { 1 }
    # address_id { 2 }
    # icon { "MyString" }
    name { "Flagstaff Gardens" }
    cheese { "Blue cheese" }
    wine { "White wine" }
  end
end
