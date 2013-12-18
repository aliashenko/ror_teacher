FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "First #{n}" }
    sequence(:last_name)  { |n| "Last #{n}" }
    email     Faker::Internet.email
    user_type "student"
    admin     false
    password  "password"
    password_confirmation "password"
  end
end
