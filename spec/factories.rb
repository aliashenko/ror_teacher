FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "First #{n}" }
    sequence(:last_name)  { |n| "Last #{n}" }
    sequence(:email)      { |n| "test_email#{n}@mail.com" }
    # email                 Faker::Internet.email
    user_type             'student'
    admin                 false
    password              'password'
    password_confirmation 'password'
  end

  factory :course do
    name                  Faker::Lorem.word.capitalize!
    public                true
  end

  factory :page do
    course
    sequence(:name)       { |n| "#{n} page"}
    content               Faker::Lorem.sentence
  end

  factory :page_invalid, parent: :page do
    name                  "ABCDEFGHIJKLMNOPQRSTU"
  end
end
