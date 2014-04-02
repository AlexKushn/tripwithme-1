class Trip < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :users, :through => :user_trips
  validates :start_time, :price, :description, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
end

class UserTrip < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip
end
