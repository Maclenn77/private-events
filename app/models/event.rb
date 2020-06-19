class Event < ApplicationRecord
  has_many :users, through: :invitations
  has_many :users, through: :user_events
end
