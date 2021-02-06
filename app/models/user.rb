class User < ApplicationRecord
  require 'rqrcode'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  
  # task refers to the 'meetings' that will be scheduled by teacher/student  
  has_many :tasks

  # before log-in / sign-up ensure that current_user has name and role
  validates :name, presence: true
  validates :role, presence: true

  enum role: {student: 0, teacher: 1}

  # allows user to log-in using their google account to access google calendar feature
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      user = User.create(
            name: data["name"],
            email: data["email"],
            role: 0,
            encrypted_password: Devise.friendly_token[0,20]
      )
    end
    user
  end
end