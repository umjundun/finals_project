class Organization < ApplicationRecord
  has_many :representatives
  include PgSearch::Model
  multisearchable against: [ :name, :mission ]

end
