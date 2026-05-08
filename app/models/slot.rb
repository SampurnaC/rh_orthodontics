class Slot < ApplicationRecord
  has_one :appointment
  scope :available, -> { where(available: true) }
end
