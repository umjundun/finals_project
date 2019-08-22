class User < ApplicationRecord
  has_many :engagements
  has_many :representatives
  has_many :projects
  belongs_to :organizations
  mount_uploader :photo, PhotoUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
