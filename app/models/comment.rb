class Comment < ActiveRecord::Base
  belongs_to :trip
  validates :trip_id, presence: true
  validates :title, presence: true
  validates :text, presence: true
end
