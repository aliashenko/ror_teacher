require 'spec_helper'
require 'database_cleaner'

describe ApplicationController, :type => :controller do
  include AuthHelper

  let(:teacher)      { FactoryGirl.create(:user, user_type: "teacher") }
  let(:student)      { FactoryGirl.create(:user, user_type: "student") }
  let(:course)       { FactoryGirl.create(:course) }
  let(:other_course) { FactoryGirl.create(:course) }

  describe ".get_viewable_courses" do
    before(:each) do
      login(user)
      subject.get_viewable_courses
    end

    context "for teacher" do
      let(:user) { teacher }

      it "returns all Courses" do
        expect(assigns[:viewable_courses]).to eq([course, other_course])
      end
    end

    context "for student" do
      let(:user) { student }

      it "returns all student's courses" do
        student.courses << course
        expect(assigns[:viewable_courses]).to eq(student.courses)
      end
    end
  end
end
