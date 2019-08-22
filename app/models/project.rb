class Project < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  #need a validation where cannot have same combo of user, org, primary
end
