class SwimmerDetail < ApplicationRecord
  belongs_to :user

  validates :name, :date_of_birth, presence: true

  enum gender: [:male, :female]
end
