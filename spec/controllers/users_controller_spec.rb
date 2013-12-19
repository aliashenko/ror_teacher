require 'spec_helper'
require 'database_cleaner'

describe UsersController do

  let(:teacher) { FactoryGirl.create(:user, user_type: 'teacher') }
  let(:student) { FactoryGirl.create(:user) }

  before { controller.stub(:current_user).and_return(student) }

  describe "GET #index" do
    before { get :index }

    it "returns success response" do
      expect(response).to be_success
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end

    it "contains only students" do
      expect(assigns[:students]).to include(student)
    end

    it "doesn't contain teachers" do
      expect(assigns[:students]).not_to include(teacher)
    end
  end

  describe "GET #show/:id" do
    let(:course)  { FactoryGirl.create(:course) }
    before { get :show, id: student }

    it "returns sucess response" do
      expect(response).to be_success
    end

    it "renders the show template" do
      expect(response).to render_template("show")
    end

    it "shows correct user" do
      expect(assigns[:user]).to eq(student)
    end

    it "shows courses for user" do
      student.courses << course
      expect(assigns[:courses]).to include(course)
    end
  end
end
