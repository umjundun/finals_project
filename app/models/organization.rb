class Organization < ApplicationRecord
  has_many :representatives
  has_many :users
end
