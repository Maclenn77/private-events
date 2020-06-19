class AttendanceList < ApplicationRecord
  belongs_to :event
  has_many :invitations
end
