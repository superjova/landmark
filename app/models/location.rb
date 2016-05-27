class Location < ApplicationRecord
  geocoded_by :address

  belongs_to :location_category
  has_many :staff_members, dependent: :destroy

  after_validation :geocode

  def self.near_to(location)
    Location.near(location, 5, {})
  end

  def color
    case type
    when "Location::FoodPantry"
      "red"
    when "Location::Shelter"
      "orange"
    when "Location::Employment"
      "purple"
    when "Location::Education"
      "green"
    when "Location::TransitionalHousing"
      "orange"
    when "Location::PlannedParenthood"
      "blue"
    when "Location::STDCenter"
      "blue"
    when "Location::Leisure"
      "yellow"
    when "Location::WIC"
      "blue"
    when "Location::Housing"
      "orange"
    end
  end
end
