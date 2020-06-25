class Invitation < ApplicationRecord
  belongs_to :guests, class_name: 'User'
  belongs_to :event

  scope :address, -> { find_by(id: Invitation.event_id).location }

end
