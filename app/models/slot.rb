class Slot < ApplicationRecord
  has_one :appointment
  scope :available, -> { where(available: true) }

  def formatted_time
    start_time.strftime("%d %B %Y - %I:%M %p")
  end

end
