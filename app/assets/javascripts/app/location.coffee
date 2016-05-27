App.Location = class Location
  constructor: (@overlord, locationData) ->
    @id = locationData.id
    @type = locationData.type
    @type_as_string = locationData.type_as_string
    @name = locationData.name
    @address = locationData.address
    @phone_number = locationData.phone_number
    @latitude = locationData.latitude
    @longitude = locationData.longitude
    @notes = locationData.notes
    @hours = locationData.hours

    $(".js-location-menu-close").click =>
      @close()

    $(".js-location-menu-action-button-directions").click =>
      if @id == $("#location-menu").data("id")
        @travel()

  open: ->
    $("#location-menu").data("id", @id)
    $(".js-location-menu-name").html(@name)
    $(".js-location-menu-type").html(@type_as_string)
    $(".js-location-menu-hours").html(@hours)
    $(".js-location-menu-notes").html(@notes)
    $(".js-location-menu-phone-number").html(@phone_number)

    if @phone_number
      $(".js-location-menu-action-call").addClass("location-menu-action-call-active")
    else
      $(".js-location-menu-action-call").removeClass("location-menu-action-call-active")

    $("#location-menu").addClass("location-menu-open")

  close: ->
    $("#location-menu").removeClass("location-menu-open")

  travel: ->
    $.ajax
      type: "GET"
      url: "/api/v1/landmark"
      data:
        location: @address
      success: (data) =>
        @overlord.trip.start(new App.Landmark(data.landmark), @)

  color: ->
    switch @type
      when "Location::FoodPantry"
        "red"
      when "Location::Shelter"
        "orange"
      when "Location::Employment"
        "purple"
      when "Location::Education"
        "green"
      when "Location::TransitionalHousing"
        "orange"
      when "Location::PlannedParenthood"
        "blue"
      when "Location::STDCenter"
        "blue"
      when "Location::Leisure"
        "yellow"
      when "Location::WIC"
        "blue"
      when "Location::Housing"
        "orange"

  latLngString: ->
    "#{@latitude}, #{@longitude}"
