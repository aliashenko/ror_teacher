require 'spec_helper'
require 'database_cleaner'

describe CoursesUserController, :type => :controller do

  let(:user)          { FactoryGirl.create(:user) }
  let(:first_course)  { FactoryGirl.create(:course) }
  let(:second_course) { FactoryGirl.create(:course) }
  let(:third_course)  { FactoryGirl.create(:course) }

  describe "GET #edit" do
    before { get :edit, id: user }

    it "returns success response" do
      expect(response).to be_success
    end

    it "renders the edit template" do
      expect(response).to render_template(:edit)
    end

    it "contains all courses" do
      expect(assigns[:courses]).to eq([first_course, second_course, third_course])
    end
  end

  describe "PATCH #update" do
    before { patch :update, id: user, courses_ids: { first_course => first_course, second_course => second_course } }

    it "contains right courses" do
      expect(assigns[:courses]).to eq([first_course, second_course])
    end

    it "assigns courses to user" do
      expect(assigns[:user].courses).to eq([first_course, second_course])
    end

    it "submits a PATCH request to the CoursesUser#update action" do
      expect(response).to redirect_to(user_path(user.id))
    end
  end

  describe "POST #start" do
    before { post :start, id: user, course_id: first_course }

    it "finds right course" do
      expect(assigns[:course]).to eq(first_course)
    end

    it "assigns courses to user" do
      expect(assigns[:user].courses).to eq([first_course])
    end

    it "submits a POST request to the CoursesUser#start action" do
      expect(response).to redirect_to(first_course)
    end
  end
end
