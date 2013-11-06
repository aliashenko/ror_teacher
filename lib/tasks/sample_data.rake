namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(first_name:  "Example",
                 last_name:   "User",
                 email:       "example@rorteacher.org",
                 user_type:   "teacher",
                 password:    "teacher_password",
                 password_confirmation: "teacher_password"
                )
    25.times do |n|
      first_name  = Faker::Name.first_name
      last_name   = Faker::Name.last_name
      email       = "example-#{n+1}@rorteacher.org"
      password  = "password"
      User.create!(first_name:  first_name,
                   last_name:   last_name,
                   email:       email,
                   user_type:   "teacher",
                   password:    password,
                   password_confirmation: password
                  )
    end

     25.times do |n|
      first_name  = Faker::Name.first_name
      last_name   = Faker::Name.last_name
      email       = "example-#{n+26}@rorteacher.org"
      password  = "password"
      User.create!(first_name:  first_name,
                   last_name:   last_name,
                   email:       email,
                   user_type:   "student",
                   password:    password,
                   password_confirmation: password

                  )
    end
    5.times do
      name = Faker::Lorem.word.capitalize!
      Course.create!(name: name,
                     public: true
                    )
      name = Faker::Lorem.word.capitalize!
      Course.create!(name: name,
                     public: false
                    )
    end
  end
end
