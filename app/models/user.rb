class User < ApplicationRecord
  has_many :events
  has_one :invitation
  validates :name, uniqueness: true
end
