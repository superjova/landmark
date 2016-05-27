App.Landmark = class Landmark
  constructor: (landmarkData) ->
    @id = landmarkData.id
    @name = landmarkData.name
    @address = landmarkData.address
    @latitude = landmarkData.latitude
    @longitude = landmarkData.longitude
    @image = landmarkData.image

  latLngString: ->
    "#{@latitude}, #{@longitude}"
