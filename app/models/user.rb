class User < ApplicationRecord
  has_many :events
  has_one :invitation
end
