class Car < ActiveRecord::Base
  belongs_to :user
  validates :name, :sits, presence: true
  validates :sits, numericality: {greater_than_or_equal_to: 1}
  #validates :user, uniqueness: true
end
