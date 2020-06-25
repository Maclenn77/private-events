class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :invitations
  has_many :guests, through: :invitations

  scope :previous, -> { where('event_date < ?', Time.zone.now) }
  scope :future, -> { where('event_date >= ?', Time.zone.now) }


  validates :location, presence: true
  validates :date, presence: true
  validates :description, presence: true

  def guest_list
    guests.collect(&:name).join(', ')
  end

  def guest_list=(guests_string)
    guest_names = guests_string.split(',').collect(&:strip).uniq
    new_or_found_guests = guest_names.collect { |name| User.find_or_create_by(name: name) }
    self.guests = new_or_found_guests
  end
end
