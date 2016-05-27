json.location_categories do
  json.array! @location_categories, partial: 'api/v1/location_categories/location_category', as: :location_category
end
