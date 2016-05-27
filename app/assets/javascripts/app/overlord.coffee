App.Overlord = class Overlord
  constructor: ->
    @map = new App.Map(@)
    @menu = new App.Menu(@)
    @trip = new App.Trip(@)
    @locations = []
    @loadOptions()

  loadOptions: ->
    @map.clearMarkers();
    @map.clearRoute();
    @trip.stop();
    ids = ($($categoryMenuOption).data("id") for $categoryMenuOption in $(".js-category-menu-option.category-menu-option-active"))
    $.ajax
      type: "GET",
      url: "/api/v1/locations"
      data:
        location: "Los Angeles",
        location_category_ids: ids
    .success (data) =>
      @locations = []
      for locationData in data.locations
        @locations.push(new App.Location(@, locationData))
      @map.center()

  optionClicked: ->
    @loadOptions()

  gotDirections: ->
    @locations[0].close()
