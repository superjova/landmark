class LocationCategory < ApplicationRecord
  # has_one :image, as: :attachable
  has_one :icon, class_name: "Image", as: :attachable
  has_many :locations, dependent: :destroy

  def default_active?
    ["Food"].include?(name)
  end

end
