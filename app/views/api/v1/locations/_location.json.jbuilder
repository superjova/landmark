json.id location.id
json.type location.type
json.type_as_string location.type_as_string
json.name location.name
json.address location.address
json.phone_number location.phone_number
json.hours location.hours
json.notes location.notes
json.latitude location.latitude
json.longitude location.longitude
json.icon asset_url('icons/' + location.color + '.png')
json.tags do
  json.array! location.tags, partial: 'api/v1/tags/tag', as: :tag
end
