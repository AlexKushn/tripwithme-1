class Trip < ActiveRecord::Base
  has_many :comments
  has_and_belongs_to_many :users
  validates :start, length: { in: 2..30 }, presence: true
  validates :stop, length: { in: 2..30 }, presence: true
  validates :start_time, timeliness: { on_or_after: lambda { DateTime.now }, type: :datetime}, presence: true
  validates :passenger, numericality: {greater_than_or_equal_to: 1, less_than: 11, only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 0.00, less_than: 1000.00 }
  validates :description, length: { in: 3..140 }, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than: 6, only_integer: true }
  accepts_nested_attributes_for :comments, allow_destroy: true
end

