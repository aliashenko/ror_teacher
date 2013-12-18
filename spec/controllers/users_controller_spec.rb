require 'spec_helper'

describe UsersController do

  let(:teacher) { FactoryGirl.create(:user) }
  let(:student) { FactoryGirl.create(:user) }

  before { controller.stub(current_user: student) }

  describe "GET #index" do
    it "GET #index" do
      get :index
      expect(response).to be_success
    end

    it "contains only students" do
      expect(@students).to include(student)
    end
  end
end
