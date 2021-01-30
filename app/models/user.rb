class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
        #  Connect with GoogleAPI
  has_many :tasks
        
  validates :name, presence: true
  validates :role, presence: true

  # devise :omniauthable, omniauth_providers: [:google_oauth2]
        
  enum role: {student: 0, teacher: 1}

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      user = User.create(
            name: data["name"],
            email: data["email"],
            encrypted_password: Devise.friendly_token[0,20]
      )
    end
    user
  end
end
