App.Overlord = class Overlord
  constructor: ->
    @map = new App.Map(@)
    @menu = new App.Menu(@)
    @trip = new App.Trip(@)
    @locations = []
    @loadOptions()
    $this = @

    $("body").on "change", ".js-filter-menu-tag input", ->
      if $(@).prop("checked")
        $(@).closest(".js-filter-menu-tag").addClass("filter-menu-tag-active")
      else
        $(@).closest(".js-filter-menu-tag").removeClass("filter-menu-tag-active")

      $this.loadOptions()

  loadOptions: ->
    @map.clearMarkers();
    @map.clearRoute();
    @trip.stop();
    category_ids = ($($categoryMenuOption).data("id") for $categoryMenuOption in $(".js-filter-menu-option.filter-menu-option-active"))
    tag_ids = ($($tagOption).data("id") for $tagOption in $(".js-filter-menu-tag.filter-menu-tag-active"))

    $.ajax
      type: "GET",
      url: "/api/v1/locations"
      data:
        location: "Los Angeles",
        location_category_ids: category_ids
        tag_ids: tag_ids
    .success (data) =>
      @locations = []
      for locationData in data.locations
        @locations.push(new App.Location(@, locationData))
      @map.center()

  optionClicked: ->
    @loadOptions()

  gotDirections: ->
    @locations[0].close()
