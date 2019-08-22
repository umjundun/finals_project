class Project < ApplicationRecord
  belongs_to :organization
  include PgSearch::Model
    multisearchable against: [ :title, :description ]
  #need a validation where cannot have same combo of user, org, primary
end
