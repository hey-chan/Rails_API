FactoryBot.define do
  factory :park do
    association :category
    # category { 2 }
    # feature { nil }
    # address { nil }
    # icon { "MyString" }
    name { "Flagstaff Gardens" }
    # cheese { "MyString" }
    # wine { "MyString" }
  end
end
