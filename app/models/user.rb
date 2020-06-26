class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_many :invitations, dependent: :destroy
  has_many :events, through: :invitations, :dependent => :destroy
  validates :name, uniqueness: true
end
