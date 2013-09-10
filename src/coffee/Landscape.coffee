class Landscape

	_clouds: null
	_$human: null
	_$selector: null
	_$dog: null
	_$tree: null
	_$fenceLeft: null
	_$fenceRight: null

	constructor: ->
		@_clouds = new Clouds()
		@_$human = $( "#character_human" )
		@_$selector = $( "#selector_human" )
		@_$dog = $( "#character_dog" )
		@_$tree = $( "#tree" )
		@_$fenceLeft = $( "#fence_left" )
		@_$fenceRight = $( "#fence_right" )

		TweenLite.set @_$human, { autoAlpha: 0, y: 25 }
		TweenLite.set @_$selector, { autoAlpha: 0, y: -10 }
		TweenLite.set @_$dog, { autoAlpha: 0, y: 25 }

		TweenLite.set @_$tree, { autoAlpha: 0, y: 25 }

		TweenLite.set @_$fenceLeft, { autoAlpha: 0, y: 15 }
		TweenLite.set @_$fenceRight, { autoAlpha: 0, y: 15 }

	show: ( delay ) ->
		@_clouds.show delay

		TweenLite.to @_$human, .5, { autoAlpha: 1, y: 0, delay: delay + .145, ease: Cubic.easeOut }
		TweenLite.to @_$selector, .5, { autoAlpha: 1, y: 0, delay: delay + .345, ease: Back.easeOut }
		TweenLite.to @_$dog, .5, { autoAlpha: 1, y: 0, delay: delay + .13, ease: Cubic.easeOut }

		TweenLite.to @_$tree, .5, { autoAlpha: 1, y: 0, delay: delay + .15, ease: Cubic.easeOut }

		# delay += .35

		TweenLite.to @_$fenceLeft, .5, { autoAlpha: 1, y: 0, delay: delay + .145, ease: Cubic.easeOut }
		TweenLite.to @_$fenceRight, .5, { autoAlpha: 1, y: 0, delay: delay + .145, ease: Cubic.easeOut }

		delay += .1



class Clouds

	_$clouds: null
	_$cloudLeft0: null
	_$cloudLeft1: null
	_$cloudRight0: null
	_$cloudRight1: null
	_$cloudRight2: null

	constructor: ->
		@_$clouds = $( "#clouds" )

		@_$cloudLeft0 = @_$clouds.find ".landscape__cloud--cloud3"
		@_$cloudLeft1 = @_$clouds.find ".landscape__cloud--cloud2"
		@_$cloudRight0 = @_$clouds.find ".landscape__cloud--cloud0"
		@_$cloudRight1 = @_$clouds.find ".landscape__cloud--cloud4"
		@_$cloudRight2 = @_$clouds.find ".landscape__cloud--cloud1"

		TweenLite.set @_$cloudLeft0, { x: 20, autoAlpha: 0 }
		TweenLite.set @_$cloudLeft1, { x: 20, autoAlpha: 0 }
		TweenLite.set @_$cloudRight0, { x: -20, autoAlpha: 0 }
		TweenLite.set @_$cloudRight1, { x: -20, autoAlpha: 0 }
		TweenLite.set @_$cloudRight2, { x: -20, autoAlpha: 0 }

	show: ( delay ) ->
		TweenLite.to @_$cloudLeft0, .5, { x: 0, autoAlpha: 1, delay: delay }
		TweenLite.to @_$cloudLeft1, .5, { x: 0, autoAlpha: 1, delay: delay + .1 }
		TweenLite.to @_$cloudRight0, .5, { x: 0, autoAlpha: 1, delay: delay + .05 }
		TweenLite.to @_$cloudRight1, .5, { x: 0, autoAlpha: 1, delay: delay + .15 }
		TweenLite.to @_$cloudRight2, .5, { x: 0, autoAlpha: 1, delay: delay + .075 }