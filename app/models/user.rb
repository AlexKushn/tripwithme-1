class User < ActiveRecord::Base
  ROLES = %w[Driver Passenger Admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :cars, foreign_key: :driver_id
  has_many :comments, foreign_key: :author_id
  has_and_belongs_to_many  :trips
  validates :name, length: { in: 2..15}, allow_nil: true
  validates :surname, length: { in: 2..20 }, allow_nil: true
  validates :phone_num, uniqueness: true, format: { with:
  /(?<!\w)(?:(?:(?:(?:\+?3)?8\W{0,5})?0\W{0,5})?[34569]\s?\d[^\w,;(\+]{0,5})?\d\W{0,5}\d\W{0,5}\d\W{0,5}\d\W{0,5}\d\W{0,5}\d\W{0,5}\d(?!(\W?\d))/x,
  message: " only valid nubember"}, allow_nil: true
  validates :role, inclusion: { in: %w(Driver Passenger), message: "%{value} is not a valid"}, allow_nil: true
  accepts_nested_attributes_for :cars, allow_destroy: true

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
end
