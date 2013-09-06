class Contact

	_$base: null
	_opened: false

	constructor: ->
		@_$base = $( "#contact" )

	show: ->
		return if @_opened
		@_opened = true
		@_$base.css "display", "block"

	hide: ->
		return if !@_opened
		@_opened = false
		@_$base.css "display", "none"