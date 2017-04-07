class SwimForm < ApplicationRecord
  validates :description, presence: true
  validates :url, presence: true

  belongs_to :user
end
