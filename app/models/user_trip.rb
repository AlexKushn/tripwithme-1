class UserTrip < ActiveRecord::Base
  has_many :users
  has_one :trip
  has_many :comments
end
