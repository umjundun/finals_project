class User < ApplicationRecord
  has_many :engagements
  has_many :representatives
  has_many :projects
  has_many :messages
  has_many :conversations, through: :messages
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

### FOR NGO DASHBOARD
  def my_projects
    if self.group == "developer"
      self.projects
    elsif self.group == "ngo"
      self.organization.projects
    else
      Project.all
    end
  end

  def my_active_projects
    if self.group == "ngo"
      self.organization.projects.where("active = true")
    end
  end

  def my_inactive_projects
    if self.group == "ngo"
      self.organization.projects.where("active = false")
    end
  end

  def my_engagements
    if self.group == "ngo"
      self.organization.engagements
    end
  end

  def my_active_engagements
    if self.group == "ngo"
      my_engagements.where("status = 'accepted'")
    end
  end

  def my_pending_engagements
    if self.group == "ngo"
      my_engagements.where("status = 'pending'")
    end
  end

  def my_engagements_by_project(project)
    if self.group == "ngo"
      Engagement.where(project: project, user: self)
    end
  end
end
