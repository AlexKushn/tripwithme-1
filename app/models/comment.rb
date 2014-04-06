class Comment < ActiveRecord::Base
  belongs_to :author, class_name: Trip
  validates :author, presence: true
  validates :title, presence: true, length: { in: 2..30 }
  validates :text, presence: true, length: { in: 3..150 }
  scope :created_before, -> (time) { where('created_at < ?', time) }
end
