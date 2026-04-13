class Appointment < ApplicationRecord
  belongs_to :user, optional: true
  validates :date, :time, presence: true
end
