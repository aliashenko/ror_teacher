require 'spec_helper'
require 'database_cleaner'

describe PagesController do

  let(:course)    { FactoryGirl.create(:course) }

  describe "GET #new" do
    before { get :new, course_id: course}

    it "returns success response" do
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    before { post :create, course_id: course, page: page }

    context "with valid attributes" do
      let(:page) { FactoryGirl.attributes_for(:page, course: course) }

      it "redirects to show action" do
        expect(subject).to redirect_to(course_page_path(course, assigns(:page).id))
      end
    end

    context "with invalid attributes" do
      let(:page) { FactoryGirl.attributes_for(:page_invalid, course: course) }

      it "renders new template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #show" do
    let(:new_page)  { FactoryGirl.create(:page, course: course) }

    before { get :show, course_id: course, id: new_page }

    it "returns success response" do
      expect(response).to be_success
    end

    it "finds right page" do
      expect(assigns[:page]).to eq(new_page)
    end
  end
end
