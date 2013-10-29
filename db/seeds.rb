# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
User.create( first_name: "Anna",   last_name: "Romanova", email: "anna@mail.com",    user_type: "student" )
User.create( first_name: "Andriy", last_name: "Romanov",  email: "andriy@mail.com",  user_type: "teacher" )

Course.delete_all
course1 = Course.create( name: "Ruby", public: true )
course2 = Course.create( name: "RoR",  public: false )

Assignment.delete_all
Assignment.create( course_id: course1.id, assignment_type: "Lecture", name: "Introduction" )
Assignment.create( course_id: course1.id, assignment_type: "Lab",     name: "Homework #1" )

Page.delete_all
Page.create( course_id: course1.id )
Page.create( course_id: course1.id )
