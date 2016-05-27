App.Trip = class Trip
  constructor: (@overlord) ->

  start: (@landmark, @destination) ->
    @overlord.map.directions(@landmark, @destination)
    $("#overlord").addClass("overlord-trip")
    $(".js-map-landmark-image").css
      backgroundImage: "url('#{@landmark.image}')"

    $(".js-map-landmark-name").html(@landmark.name)
    $(".js-map-landmark-address").html(@landmark.address)

  stop: ->
    $("#overlord").removeClass("overlord-trip")
