class Invitation < ApplicationRecord
  belongs_to :events
  belongs_to :user
end
