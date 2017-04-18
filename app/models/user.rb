class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  validates :email,
         presence: true,
         uniqueness: { case_sensitive: false },
         length: { minimum: 3, maximum: 254 }

  validates :first_name, presence: true
  validates :last_name, presence: true

  enum role: [:standard, :admin]

  has_many :swim_forms
  has_many :swimmer_details

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.image = auth.info.image
    end
  end
end
