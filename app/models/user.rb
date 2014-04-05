class User < ActiveRecord::Base
  ROLES = %w[driver passenger]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many  :cars, foreign_key: :driver_id, dependent: :destroy
  has_many  :trip, :through => :user_trips
  validates :name, length: { minimum: 2}, allow_nil: true
  validates :surname, length: { minimum: 2}, allow_nil: true
  validates :phone_num, uniqueness: true, allow_nil: true
end
