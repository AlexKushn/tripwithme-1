require 'spec_helper'


describe Car do
  context 'when user logged in' do
    let(:user) { FactoryGirl.create(:user) }
    before do
      user.role = 'Driver'
    end
  it "has a valid factory"  do
    FactoryGirl.build(:car).should be_valid
  end

  it { should belong_to(:driver).class_name(User) }
  it { should ensure_length_of(:name).is_at_least(2).is_at_most(15) }
  it { should_not allow_value('').for(:name) }
  it { should validate_numericality_of(:sits).is_greater_than_or_equal_to(1).is_less_than_or_equal_to(10).only_integer }
  it { should validate_presence_of(:driver) }
  end
end
