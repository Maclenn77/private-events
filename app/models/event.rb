class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :guests, through: :invitations

  scope :previous, -> { where('event_date < ?', Time.zone.now) }
  scope :future, -> { where('event_date >= ?', Time.zone.now) }

  validates :location, presence: true
  validates :date, presence: true
  validates :description, presence: true
end
