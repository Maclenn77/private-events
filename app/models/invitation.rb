class Invitation < ApplicationRecord
  belongs_to :attendance_list
  belongs_to :events, through: :attendance_list
  belongs_to :user
end
