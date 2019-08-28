class User < ApplicationRecord
  has_many :engagements
  has_many :representatives
  has_many :projects
  belongs_to :organization
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
    if current_user.group == "developer"
      @user.projects
    elsif current_user.group == "ngo"
      @user.organization.projects
    else
      Project.all
    end
  end

  def active_projects
    if current_user.group == "ngo"
      @user.organization.projects.where("active = true")
    end
  end

  def my_engagements
    if current_user.group == "ngo"
      @user.organization.engagements
    end
  end

  def my_active_engagements
    if current_user.group == "ngo"
      my_engagements.where("status = 'accepted'")
    end
  end

  def my_pending_engagements
    if current_user.group == "ngo"
      my_engagements.where("status = 'pending'")
    end
  end

  def my_engagements_by_project(project)
    if self.group == "ngo"
      Engagement.where(project: project, user: self)
    end
  end
end
