class User < ApplicationRecord
  has_many :events, through: :user_events
  has_many :events, through: :invitations
end
