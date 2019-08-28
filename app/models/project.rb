class Project < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  has_many :engagements
  has_many :project_files

  include PgSearch::Model
  multisearchable against: [:title, :description, :category]
  # need a validation where cannot have same combo of user, org, primary
end
