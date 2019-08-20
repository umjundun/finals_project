class User < ApplicationRecord
  has_many :engagements
  has_many :representatives
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attr_accessible :first_name, :last_name, :email, :password,
                  :encrypted_password, :reset_password_token,
                  :reset_password_sent_at
end
