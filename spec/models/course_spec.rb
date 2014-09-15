require 'spec_helper'

describe Course do
  before do
    @course = Course.new( name: "App course", public: true )
  end

  subject { @course }

  it { should respond_to(:name) }
  it { should respond_to(:public) }
  it { should be_valid }

  describe "when course name is not present" do
    before { @course.name = " " }
    it { should_not be_valid }
  end

  # describe "when course type is not present" do
  #   before { @course.public = " " }
  #   it { should_not be_valid }
  # end

  describe "is_public?" do
    it "should be true" do
      expect( @course.is_public? ).to be_truthy
    end

    it "should be false" do
      @course.public = false
      expect( @course.is_public? ).to be_falsey
    end
  end

end
