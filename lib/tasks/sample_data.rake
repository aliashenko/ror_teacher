namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(first_name:  "Example",
                 last_name:   "User",
                 email:       "example@rorteacher.org",
                 user_type:   "teacher",
                 password:    "password",
                 password_confirmation: "password",
                 admin:       true
                 # avatar:      "app/assets/images/large/missing.png"
                )
    50.times do |n|
      first_name  = Faker::Name.first_name
      last_name   = Faker::Name.last_name
      email       = "example-#{n+1}@rorteacher.org"
      password    = "password"
      User.create!(first_name:  first_name,
                   last_name:   last_name,
                   email:       email,
                   user_type:   "student",
                   password:    password,
                   password_confirmation: password
                   # avatar:      "app/assets/images/large/missing.png"
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
