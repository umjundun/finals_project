class Organization < ApplicationRecord
  has_many :representatives
<<<<<<< HEAD

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
=======
  has_many :users
>>>>>>> engagment_logic
end
