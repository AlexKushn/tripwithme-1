class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :cars
  has_one  :trip, :through => :user_trips
  #validates :name, :surname, :phone_num, presence: true
  #validates :phone_num, uniqueness: true
  #validates :phone_num, format: { with: %r{\+([\d]){3}-([\d]){9}}, message: "acceptance format was: +123-123456789"}
end
