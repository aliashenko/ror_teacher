require 'spec_helper'
require 'database_cleaner'

describe CoursesController, :type => :controller do
  include AuthHelper

  let(:user)         { FactoryGirl.create(:user) }
  let(:course)       { FactoryGirl.create(:course) }
  let(:other_course) { FactoryGirl.create(:course) }

  before(:each) { login(user) }

  describe "GET #index" do
    before { get :index }

    it "returns success response" do
      expect(response).to be_success
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end

    it "contains all courses" do
      expect(assigns[:courses]).to eq([course, other_course])
    end
  end

  describe "GET #show" do
    before { get :show, id: course }

    let(:page)       { FactoryGirl.create(:page, course: course) }
    let(:other_page) { FactoryGirl.create(:page, course: course) }

    it "returns success response" do
      expect(response).to be_success
    end

    it "renders the show template" do
      expect(response).to render_template("show")
    end

    it "shows all available pages" do
      expect(assigns[:pages]).to include(page, other_page)
    end
  end
end
