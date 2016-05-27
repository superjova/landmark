class LocationCategory < ApplicationRecord
  has_many :locations, dependent: :destroy
end
