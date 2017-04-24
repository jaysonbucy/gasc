class SwimEvent < ApplicationRecord
  validates :name, presence: true
  validates :distance_in_yards, presence: true
  validates :age_group_start, presence: true
  validates :age_group_end, presence: true

  enum gender: [:male, :female]

  has_many :event_heats
end
