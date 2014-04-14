class Trip < ActiveRecord::Base
  has_many :comments
  has_and_belongs_to_many :users
  validates :start, :stop, :start_time, presence: true
  validates :passengers, numericality: {greater_than_or_equal_to: 1, less_than: 10, only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 0.00 },allow_nil: true
  validates :description, length: { maximum: 140 }, allow_nil: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than: 6, only_integer: true }, allow_nil: true
  accepts_nested_attributes_for :comments, allow_destroy: true
end

