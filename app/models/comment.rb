class Comment < ActiveRecord::Base
  belongs_to :trip
  validates :trip_id, presence: true
  validates :title, presence: true, length: { maximum: 80 }
  validates :text, presence: true, length: { maximum: 500 }
  scope :created_before, -> (time) { where('created_at < ?', time) }
end
