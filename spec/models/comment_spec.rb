require 'spec_helper'

describe Comment do

  let(:trip) { FactoryGirl.create(:trip) }
  before { @comment = trip.comments.build(title: "Title_ ", text: "Lorem ipsum") }

  subject { @comment }

  it { should respond_to(:title) }
  it { should respond_to(:text) }
  it { should respond_to(:trip_id) }
  it { should respond_to(:trip) }
  its(:trip) { should eq trip }

  it {should be_valid}

  describe "when trip_id is not present" do
    before { @comment.trip_id = nil }
    it { should_not be_valid }
  end

  describe "with blank title" do
    before { @comment.title = " " }
    it { should_not be_valid }
  end

  describe "with blank text" do
    before { @comment.text = " "}
    it { should_not be_valid }
  end
end