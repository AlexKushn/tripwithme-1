class User < ActiveRecord::Base
  ROLES = %w[driver passenger admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :cars, foreign_key: :driver_id
  has_many :comments, foreign_key: :author_id
  has_and_belongs_to_many  :trips
  validates :name, length: { in: 2..15}, allow_nil: true
  validates :surname, length: { in: 2..20 }, allow_nil: true
  validates :phone_num, uniqueness: true, allow_nil: true
  accepts_nested_attributes_for :cars, allow_destroy: true
end
