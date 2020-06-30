class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_many :invitations, dependent: :destroy
  has_many :events, foreign_key: :attended_event, through: :invitations, dependent: :destroy
  validates :name, uniqueness: true

  def self.return_current_user(session)
    find_by(id: session) if session
  end

  def self.find_creator(creator)
    find(creator)
  end

end
