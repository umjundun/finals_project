class Project < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  has_many :engagements
  #need a validation where cannot have same combo of user, org, primary
end
