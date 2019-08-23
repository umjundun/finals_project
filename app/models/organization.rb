class Organization < ApplicationRecord
  has_many :representatives
  has_many :users
  has_many :projects
  has_many :engagements, through: :projects
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  multisearchable against: [ :name, :mission ]
end
