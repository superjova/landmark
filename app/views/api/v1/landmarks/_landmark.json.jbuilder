json.id landmark.id
json.name landmark.name
json.address landmark.address
json.latitude landmark.latitude
json.longitude landmark.longitude
if landmark.image
  json.image landmark.image.url
  json.icon landmark.image.attachment.thumb.url
end
