json.landmarks do
  json.array! @landmarks, partial: 'api/v1/landmarks/landmark', as: :landmark
end
