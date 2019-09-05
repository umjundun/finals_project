class Engagement < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :status, inclusion: { in: ["Pending", "Accepted", "Rejected", "Archived"] }
  validates :dev_status, inclusion: { in: ["Checked out", "Available", "Awaiting developer action", "Pending dev action"] }
end
