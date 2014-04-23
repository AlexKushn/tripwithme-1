class Comment < ActiveRecord::Base
  belongs_to :trip
  belongs_to :author, class_name: User
  validates :author, presence: true
  validates :title, presence: true, length: { in: 2..30 }
  validates :text, presence: true, length: { in: 3..150 }

  delegate :name, to: :author, prefix: true, allow_nil: true
  alias_attribute :name, :title

  scope :created_before, -> (time) { where('created_at < ?', time) }
end
