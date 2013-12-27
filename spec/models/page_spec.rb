require 'spec_helper'

describe Page do
  it { should belong_to(:course) }

  it { should respond_to(:course_id) }
  it { should respond_to(:name) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:course_id) }
  it { should ensure_length_of(:name).is_at_most(15) }
  it { should ensure_length_of(:content).is_at_most(1000) }
end
