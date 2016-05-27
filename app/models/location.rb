class Location < ApplicationRecord
  geocoded_by :address

  belongs_to :location_category
  has_many :location_tags
  has_many :staff_members, dependent: :destroy
  has_many :tags, through: :location_tags

  after_validation :geocode

  def self.near_to(location)
    Location.near(location, 5, {})
  end

  def self.filter(options)
    locations = all
    locations = locations.where(location_category_id: options[:location_category_ids]) if options[:location_category_ids].present?
    locations = locations.where(location_tags: { tag_id: options[:tag_ids] }) if options[:tag_ids].present?
    locations
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
