class Contact

	_$base: null
	_$main: null
	_$btClose: null
	_opened: false

	constructor: ->
		@_$base = $( "#contact" )
		@_$main = $( "#main" )
		@_$btClose = $( "#bt_close_contact" )

	show: ->
		return if @_opened
		@_opened = true
		@_$base.css "display", "block"
		@_$main.css "bottom", "105px"
		@_$btClose.click @_closeClickHandler

	_closeClickHandler: ( e ) =>
		e.preventDefault()
		@hide()

	hide: ->
		return if !@_opened
		@_opened = false
		@_$base.css "display", "none"
		@_$main.css "bottom", 0