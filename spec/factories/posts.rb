FactoryBot.define do
  factory :post do
    user { nil }
    comment { "MyText" }
    rating { 1 }
    park { nil }
  end
end
