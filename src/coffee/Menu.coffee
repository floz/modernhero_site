class Menu

	_$menu: null
	_$links: null

	constructor: ->
		@_$menu = $( "#menu" )
		@_$links = @_$menu.find "a"
		TweenLite.set @_$menu, { autoAlpha: 0, y: 30 }
		for link in @_$links
			TweenLite.set link, { autoAlpha: 0, y: 20 }

	show: ( delay ) ->
		TweenLite.to @_$menu, .6, { autoAlpha: 1, y: 0, delay: delay, ease: Cubic.easeOut }

		d = 0
		for link in @_$links
			TweenLite.to link, .6, { autoAlpha: 1, y: 0, delay: delay + .1 + d, ease: Quad.easeOut }
			d += .075