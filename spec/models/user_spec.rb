require 'spec_helper'

describe User do
  before do
    @user = User.new( first_name: 'Anna', last_name: 'Romanova', email: 'anna@mail.com', user_type: 'student', password: 'password', admin: false )
  end

  subject { @user }

  it { should have_many(:courses_users) }
  it { should have_many(:courses).through(:courses_users) }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:user_type) }
  it { should respond_to(:is_student?) }
  it { should respond_to(:is_teacher?) }
  it { should respond_to(:has_course?) }
  it { should respond_to(:is_admin?) }

  it { should be_valid }
  it { should_not be_admin }


  describe "when first name is not present" do
    before { @user.first_name = " " }

    it { should_not be_valid }
  end

  describe "when last name is not present" do
    before { @user.last_name = " " }

    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }

    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe "is_student" do
    it "should be true" do
      expect( @user.is_student? ).to be_truthy
    end
    it "should be false" do
      @user.user_type = "teacher"
      expect( @user.is_student? ).to be_falsey
    end
  end

  describe "is_teacher" do
    it "should be true" do
      @user.user_type = "teacher"
      expect( @user.is_teacher? ).to be_truthy
    end
    it "should be false" do
      expect( @user.is_teacher? ).to be_falsey
    end
  end

  describe "has_course" do
    before { @course = Course.new( name: "RoR", public: true ) }
    it "should be true" do
      @user.courses << @course
      expect( @user.has_course?( @course ) ).to be_truthy
    end
    it "should be false" do
      @course.name = "Rails"
      expect( @user.has_course?( @course ) ).to be_falsey
    end
  end

  describe "is_admin" do
    it "should be true" do
      @user.admin = true
      expect( @user.is_admin? ).to be_truthy
    end
    it "should be false" do
      expect( @user.is_admin? ).to be_falsey
    end
  end
end
