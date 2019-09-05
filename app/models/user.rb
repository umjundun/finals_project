class User < ApplicationRecord
  has_many :engagements
  has_many :representatives
  has_many :projects
  has_many :ngo_engagements, through: :projects, source: "engagements"
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

  def conversations
    Conversation.joins(:sender, :recipient).where("users.id = :id OR recipients_conversations.id = :id", id: id).distinct
  end

  def my_projects
    if self.group == "ngo"
      self.projects
    else
      Project.all
    end
  end

  def my_active_projects
    unless my_projects.empty?
      my_projects.where("status = 'Active'")
    end
  end

  def my_archived_projects
    unless my_projects.empty?
      my_projects.where("status = 'Archived'")
    end
  end













  def my_engagements
    if self.group == "ngo"
      ngo_engagements
    elsif self.group == "developer"
      self.engagements
    else
      Engagement.all
    end
  end

  def my_active_engagements
    unless my_engagements.empty?
      my_engagements.where("engagements.status = 'Active'")
    end
  end

  def my_pending_engagements
    unless my_engagements.empty?
      my_engagements.where("engagements.status = 'Pending'")
    end
  end

  def my_rejected_engagements
    unless my_engagements.empty?
      my_engagements.where("engagements.status = 'Rejected'")
    end
  end

  def my_archived_engagements
    unless my_engagements.empty?
      my_engagements.where("engagements.status = 'Archived'")
    end
  end


  def my_engagements_by_project(project)
    Engagement.where(project: project, user: self)
  end
end
