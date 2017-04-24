class EventHeat < ApplicationRecord
  belongs_to :swim_meet
  belongs_to :swim_event

  has_many :swim_time
end
