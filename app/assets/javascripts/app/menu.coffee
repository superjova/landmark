App.Menu = class Menu
  constructor: (@overlord) ->
    $this = @

    $(".js-filter-menu-open").click =>
      @open()

    $(".js-filter-menu-close").click =>
      @close()

    $(".js-filter-menu-option").click ->
      $this.optionClicked($(@))
      $this.overlord.optionClicked()

  open: ->
    @overlord.map.clearMarkers()
    @overlord.loadOptions()
    $("#overlord").addClass("overlord-menu-open")

  close: ->
    $("#overlord").removeClass("overlord-menu-open")

  optionClicked: ($option) ->
    $option.toggleClass("filter-menu-option-active")
