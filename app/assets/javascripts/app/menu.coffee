App.Menu = class Menu
  constructor: (@overlord) ->
    $this = @

    $(".js-category-menu-open").click =>
      @open()

    $(".js-category-menu-close").click =>
      @close()

    $(".js-category-menu-option").click ->
      $this.optionClicked($(@))
      $this.overlord.optionClicked()

  open: ->
    @overlord.map.clearMarkers()
    @overlord.loadOptions()
    $("#overlord").addClass("overlord-menu-open")

  close: ->
    $("#overlord").removeClass("overlord-menu-open")

  optionClicked: ($option) ->
    $option.toggleClass("category-menu-option-active")
