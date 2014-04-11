require 'spec_helper'

describe Comment do

  it "has a valid factory"  do
    FactoryGirl.build(:comment).should be_valid
  end

  it { should belong_to(:author).class_name(User) }
  it { should ensure_length_of(:title).is_at_least(2).is_at_most(30) }
  it { should ensure_length_of(:text).is_at_least(3).is_at_most(150) }
  it { should validate_presence_of(:author) }

end
