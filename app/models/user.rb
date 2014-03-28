class User < ActiveRecord::Base
  has_many :cars
  has_one  :trip, :through => :user_trips
end
