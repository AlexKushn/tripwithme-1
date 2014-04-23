class Car < ActiveRecord::Base

  belongs_to :driver, class_name: User
  validates :driver, presence: true
  validates :car_name, length: { in: 2..15 }
  validates :sit, numericality: {greater_than_or_equal_to: 1, less_than: 11, only_integer: true }
  delegate :name, to: :driver, prefix: true, allow_nil: true
end
