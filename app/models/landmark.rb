class Landmark < ApplicationRecord
  geocoded_by :address

  has_one :image, as: :attachable, autosave: true

  validates :name, :address, presence: true

  after_validation :geocode

  attr_accessor :remote_image_url

  def remote_image_url=(image_url)
    self.image ||= Image.new
    self.image.remote_attachment_url = image_url
  end

  def self.nearest_to(location)
    self.near(location, 20, {}).first
  end

end
