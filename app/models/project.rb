class Project < ApplicationRecord
  belongs_to :organization

  #need a validation where cannot have same combo of user, org, primary
end
