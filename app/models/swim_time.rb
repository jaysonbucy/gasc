class SwimTime < ApplicationRecord
  belongs_to :event_heat
  belongs_to :swimmer_detail

  validates :time_in_seconds, presence: true

  scope :best_time, -> (event,swimmer, distance) {
    joins(:swimmer_detail).joins(event_heat: :swim_event)
    .where(swim_events: { name: event, distance_in_yards: distance }, swimmer_details: { id: swimmer })
    .order(time_in_seconds: :asc)
  }

  scope :meet_times, -> (meet, swimmer) {
    joins(:swimmer_detail).joins(event_heat: :swim_meet).joins(event_heat: :swim_event)
    .where(swim_meets: { name: meet.name }).where(swimmer_details: { id: swimmer.id })
  }

end
