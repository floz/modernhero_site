class Contact

	_$base: null
	_$main: null
	_$btClose: null
	_opened: false

	constructor: ->
		@_$base = $( "#contact" )
		@_$main = $( "#main" )
		@_$btClose = $( "#bt_close_contact" )

		TweenLite.set @_$base, { autoAlpha: 0, y: 70 }

	show: ->
		return if @_opened
		@_opened = true

		@_$base.css "display", "block"
		TweenLite.set @_$base, { autoAlpha: .8 }
		TweenLite.to @_$base, .8, { autoAlpha: 1, y: 0, ease: Cubic.easeOut }
		TweenLite.to @_$main, .7, { bottom: "105px", delay: .05, ease: Cubic.easeOut }
		
		@_$btClose.click @_closeClickHandler

	_closeClickHandler: ( e ) =>
		e.preventDefault()
		@hide()

	hide: ->
		return if !@_opened
		@_opened = false

		@_$btClose.unbind()

		TweenLite.to @_$base, .3, { autoAlpha: 0, y: 100, delay: .025, ease: Cubic.easeOut, onComplete: @_onHideComplete }
		TweenLite.to @_$main, .4, { bottom: "0", ease: Cubic.easeOut }

	_onHideComplete: =>
		TweenLite.set @_$base, { autoAlpha: 0 }
		@_$base.css "display", "none"
