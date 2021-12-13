FactoryBot.define do
  factory :user do
    username { "tester" }
    email { "test@picvic.com.au" }
    password { "password1" }
    password_confirmation { "password1" }
  end
end
