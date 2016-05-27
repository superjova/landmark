class Location < ApplicationRecord
  geocoded_by :address

  has_many :staff_members, dependent: :destroy

  after_validation :geocode

end
