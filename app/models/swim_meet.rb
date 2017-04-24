class SwimMeet < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  
  has_many :event_heats
end
