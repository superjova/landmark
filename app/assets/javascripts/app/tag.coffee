App.Tag = class Tag
  constructor: (@overlord, tagData) ->
    @id = tagData.id
    @name = tagData.name
    @color = tagData.color

  html: ->
    """<div class="location-menu-tag location-menu-tag-#{@color}" data-id="#{@id}">#{@name}</div>"""
