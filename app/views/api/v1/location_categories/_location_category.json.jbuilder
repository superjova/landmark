json.id location_category.id
json.name location_category.name
if location_category.image
  json.image location_category.image.url
end
if location_category.active_image
  json.active_image location_category.active_image.url
end
if location_category.inactive_image
  json.inactive_image location_category.inactive_image.url
end
