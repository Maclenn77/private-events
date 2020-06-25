class Invitation < ApplicationRecord
  belongs_to :guests, class_name: 'User'
  belongs_to :event

  scope :address, -> { }

end
