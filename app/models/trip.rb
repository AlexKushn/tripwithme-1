class Trip < ActiveRecord::Base
  has_many :comments
  has_many :users, :through => :user_trips
end

class UserTrip < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip
end
