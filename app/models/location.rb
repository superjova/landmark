class Location < ApplicationRecord
  geocoded_by :address

  belongs_to :location_category
  has_many :staff_members, dependent: :destroy

  after_validation :geocode

  def self.near_to(location)
    Location.near(location, 5, {})
  end
end
