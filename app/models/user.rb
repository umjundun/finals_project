class User < ApplicationRecord
  has_many :engagements
  has_many :representatives
  has_many :projects
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

  # def my_active_projects
  #   active = [];
  #   if self.group == "ngo"
  #     my_projects.each do |project|
  #       where("active = true")
  #     end
  #   end
  # end

  # def my_inactive_projects
  #   if self.group == "ngo"
  #     self.organization.projects.where("active = false")
  #   end
  # end

  def my_engagements
    if self.group == "ngo"
      # self.projects.engagements
    elsif self.group == "developer"
      self.engagements
    else
      Engagement.all
    end
  end

  def my_active_engagements
    my_engagements.where("status = 'Active'")
  end

  def my_pending_engagements
    my_engagements.where("status = 'Pending'")
  end

  def my_rejected_engagements
    my_engagements.where("status = 'Rejected'")
  end

  def my_archived_engagements
    my_engagements.where("status = 'Archived'")
  end


  def my_engagements_by_project(project)
    Engagement.where(project: project, user: self)
  end
end
