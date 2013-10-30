namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(first_name:  "Example",
                 last_name:   "User",
                 email:       "example@rorteacher.org",
                 user_type:   "teacher"
                )
    25.times do |n|
      first_name  = Faker::Name.first_name
      last_name   = Faker::Name.last_name
      email       = "example-#{n+1}@rorteacher.org"
      User.create!(first_name:  first_name,
                   last_name:   last_name,
                   email:       email,
                   user_type:   "teacher"
                  )
    end

     25.times do |n|
      first_name  = Faker::Name.first_name
      last_name   = Faker::Name.last_name
      email       = "example-#{n+1}@rorteacher.org"
      User.create!(first_name:  first_name,
                   last_name:   last_name,
                   email:       email,
                   user_type:   "student"
                  )
    end
    5.times do
      name = Faker::Name.first_name
      Course.create!(name: name,
                     public: true
                    )
      name = Faker::Name.first_name
      Course.create!(name: name,
                     public: false
                    )
    end
  end
end
