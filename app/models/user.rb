class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  validates :email,
         presence: true,
         uniqueness: { case_sensitive: false },
         length: { minimum: 3, maximum: 254 }

  validates :firstname, presence: true
  validates :lastname, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.firstname = auth.info.first_name
      user.lastname = auth.info.last_name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.image = auth.info.image
    end
  end
end
