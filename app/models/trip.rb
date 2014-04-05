class Trip < ActiveRecord::Base
  has_many :comments,foreign_key: :author_id, dependent: :destroy
  has_many :users, :through => :user_trips
  validates :start, :stop, :start_time, presence: true
  validates :passengers, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 0.00 }
  validates :description, length: { maximum: 140 }
  validates :rating, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end

class TripUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip
end
