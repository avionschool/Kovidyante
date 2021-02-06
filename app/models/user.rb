class User < ApplicationRecord
  require 'rqrcode'
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

<<<<<<< HEAD
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
=======
  
>>>>>>> f20ae8f7150e787ece31b981c6e3bff2aed64719
end
