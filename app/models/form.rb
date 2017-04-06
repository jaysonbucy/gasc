class Form < ApplicationRecord
  validates :description, presence: true
  validates :url, presence: true
  validates :created_by, presence: true
end
