class Appointment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :slot
end
