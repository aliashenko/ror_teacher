require 'spec_helper'

describe UserHelper, :type => :helper do

  before do
    @user = User.new( first_name: 'Anna', last_name: 'Romanova', email: 'anna@mail.com', user_type: 'student' )
  end

  subject { full_name(@user) }

  describe '#full_name' do
    it 'should include the first name' do
      should match(/Anna/)
    end

    it 'should include the last name' do
      should match(/Romanova/)
    end
  end
end
