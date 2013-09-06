class Gallery

	_$base: null
	_$layer: null
	_$btClose: null
	_opened: false

	constructor: ->
		@_$base = $( "#gallery" )
		@_$layer = $( "#layer" )
		@_$btClose = $( "#bt_close_gallery" )

	show: ->
		return if @_opened
		@_opened = true
		@_$base.css "display", "block"
		@_$layer.css "display", "block"
		@_$btClose.click @_closeClickHandler

	_closeClickHandler: ( e ) =>
		e.preventDefault()
		@hide()

	hide: ->
		return if !@_opened
		@_opened = false
		@_$base.css "display", "none"
		@_$layer.css "display", "none"
