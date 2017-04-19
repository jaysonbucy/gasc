class SwimTime < ApplicationRecord
  belongs_to :event_heat
  belongs_to :swimmer_detail

  validates :time_in_seconds, presence: true
end
