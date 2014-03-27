class User < ActiveRecord::Base
  has_many :cars
  belongs_to :user_trip
end
