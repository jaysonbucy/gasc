class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email,
         presence: true,
         uniqueness: { case_sensitive: false },
         length: { minimum: 3, maximum: 254 }

  validates :firstname, presence: true
  validates :lastname, presence: true
end
