App.LocationCategory = class LocationCategory
  constructor: (locationCategoryData) ->
    @id = locationCategoryData.id
    @name = locationCategoryData.name
    @position = locationCategoryData.position
    @image = locationCategoryData.image.url
    @active_image = locationCategoryData.active_image
    @inactive_image = locationCategoryData.inactive_image.url

