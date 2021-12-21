FactoryBot.define do
  factory :park do
    association :category
    association :feature
    # category { 2 }
    # feature { nil }
    # address { nil }
    # icon { "MyString" }
    name { "Flagstaff Gardens" }
    cheese { "Blue cheese" }
    wine { "White wine" }
  end
end
