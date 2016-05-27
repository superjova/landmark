class Tag < ApplicationRecord

  has_many :location_tags

  before_create :generate_color

  validates :name, presence: true

  private

  def generate_color
    self.color = ["red", "orange", "green", "blue", "pink", "yellow", "purple"].shuffle.first
  end

end
