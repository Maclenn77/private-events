class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_one :invitation
  validates :name, uniqueness: true
end
