class Car < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true
  validates :sits, presence: true, numericality: {greater_than_or_equal_to: 1}
end
