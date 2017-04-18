class SwimTime < ApplicationRecord
  belongs_to :event_heats
  belongs_to :swimmer_details
end
