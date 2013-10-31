require 'spec_helper'

describe UserHelper do

  before do
    @user = User.new( first_name: "Anna", last_name: "Romanova", email: "anna@mail.com", user_type: "student" )
  end

  subject { @user }

  describe "full_name" do
    it "should include the first name" do
      expect(full_name(@user)).to match(/Anna/)
    end

    it "should include the last name" do
      expect(full_name(@user)).to match(/Romanova/)
    end
  end
end
