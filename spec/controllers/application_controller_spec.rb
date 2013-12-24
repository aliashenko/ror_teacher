require 'spec_helper'
require 'database_cleaner'

 describe ApplicationController do

   let(:teacher)        { FactoryGirl.create(:user, user_type: "teacher") }
   let(:student)        { FactoryGirl.create(:user, user_type: "student") }
   let(:course)         { FactoryGirl.create(:course) }
   let(:other_course)   { FactoryGirl.create(:course) }

   describe ".get_viewable_courses" do
     controller do
       before_filter :get_viewable_courses
       def index
         render text: "blabla"
       end
     end

     subject(:get_request) { get :index }

     context "for teacher" do
       before { controller.stub(:current_user).and_return(teacher) }

       it "returns all Courses" do
         get_request
         expect(assigns[:viewable_courses]).to eq([course, other_course])
       end
     end

     context "for student" do
       before { controller.stub(:current_user).and_return(student) }

       it "returns all student's courses" do
         get_request
         student.courses << course
         expect(assigns[:viewable_courses]).to eq(student.courses)
       end
     end

   end
 end
