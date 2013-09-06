class Gallery

	_$base: null
	_$layer: null
	_opened: false

	constructor: ->
		@_$base = $( "#gallery" )
		@_$layer = $( "#layer" )

	show: ->
		return if @_opened
		@_opened = true
		@_$base.css "display", "block"
		console.log @_$layer
		@_$layer.css "display", "block"

	hide: ->
		return if !@_opened
		@_opened = false
		@_$base.css "display", "none"
		@_$layer.css "display", "none"
