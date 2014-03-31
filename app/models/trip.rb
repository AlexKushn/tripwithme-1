class Trip < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :users, :through => :user_trips
end

class UserTrip < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip
end
