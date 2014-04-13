class Car < ActiveRecord::Base

  belongs_to :driver, class_name: User
  validates :driver, presence: true
  validates :name, length: { in: 2..15 }
  validates :sits, numericality: {greater_than_or_equal_to: 1, less_than: 10}
  delegate :name, to: :driver, prefix: true, allow_nil: true
end
