class SwimmerDetail < ApplicationRecord
  belongs_to :user

  validates :name, :date_of_birth, presence: true

  enum gender: [:male, :female]

  has_many :swim_times
end
