class Event < ApplicationRecord
  has_one :user
  has_one :attendance_list
  has_many :invitations, through: :attendance_list
end
