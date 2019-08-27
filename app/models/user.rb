class User < ApplicationRecord
  has_many :engagements
  has_many :representatives
  has_many :projects
  has_many :conversations
  has_many :messages
  belongs_to :organization
  has_many :notifications, foreign_key: :recipient_id
  mount_uploader :photo, PhotoUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    self.first_name + ' ' + self.last_name
  end
  #
  # def self.user_chart
  #   User.group(:group).count
  # end
end
