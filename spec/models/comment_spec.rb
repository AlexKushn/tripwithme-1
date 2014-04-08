require 'spec_helper'

describe Comment do

  it "has a valid factory"  do
    FactoryGirl.build(:comment).should be_valid
  end

  it { should belong_to(:author).class_name(Trip) }
  it { should ensure_length_of(:title).is_at_least(2).is_at_most(30) }
  it { should ensure_length_of(:text).is_at_least(3).is_at_most(150) }
  it { should validate_presence_of(:author) }
  let(:trip) { FactoryGirl.create(:trip) }
  before { @comment = trip.comments.build(title: "Title_ ", text: "Lorem ipsum") }

  subject { @comment }

  it { should respond_to(:title) }
  it { should respond_to(:text) }
  it {should be_valid}


  describe "with blank title" do
    before { @comment.title = " " }
    it { should_not be_valid }
  end

  describe "with blank text" do
    before { @comment.text = " "}
    it { should_not be_valid }
  end
end
