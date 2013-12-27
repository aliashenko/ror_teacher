require 'spec_helper'

describe CoursesUser do
  it { should belong_to(:user) }
  it { should belong_to(:course) }
  it { should belong_to(:owner).with_foreign_key(:owner_id) }
end
