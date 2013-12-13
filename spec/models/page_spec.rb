require 'spec_helper'

describe Page do
  before do
    @page = Page.new( course_id: 1, name: "New course" )
  end

  subject { @page }

  it { should respond_to(:course_id) }
  it { should respond_to(:name) }

  it { should be_valid }
end
