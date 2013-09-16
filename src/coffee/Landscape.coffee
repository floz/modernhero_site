class Landscape

	_clouds: null
	_$human: null
	_$selector: null
	_$dog: null
	_$tree: null
	_$fenceLeft: null
	_$fenceRight: null
	_$eyesHuman: null
	_$eyesDog: null

	constructor: ->
		@_clouds = new Clouds()
		@_$human = $( "#character_human" )
		@_$selector = $( "#selector_human" )
		@_$dog = $( "#character_dog" )
		@_$tree = $( "#tree" )
		@_$fenceLeft = $( "#fence_left" )
		@_$fenceRight = $( "#fence_right" )
		@_$eyesHuman = @_$human.find ".eyes"
		@_$eyesDog = @_$dog.find ".eyes"

		TweenLite.set @_$human, { autoAlpha: 0, y: 25 }
		TweenLite.set @_$selector, { autoAlpha: 0, y: -10 }
		TweenLite.set @_$dog, { autoAlpha: 0, y: 25 }

		TweenLite.set @_$tree, { autoAlpha: 0, y: 25 }

		TweenLite.set @_$fenceLeft, { autoAlpha: 0, y: 15 }
		TweenLite.set @_$fenceRight, { autoAlpha: 0, y: 15 }

	show: ( delay ) ->
		@_clouds.show delay

		TweenLite.to @_$human, .5, { css: { autoAlpha: 1, y: 0 }, delay: delay + .145, ease: Cubic.easeOut }
		TweenLite.to @_$selector, .5, { css: { autoAlpha: 1, y: 0 }, delay: delay + .345, ease: Back.easeOut }
		TweenLite.to @_$dog, .5, { css: { autoAlpha: 1, y: 0 }, delay: delay + .13, ease: Cubic.easeOut, onComplete: @_startBlinking }

		TweenLite.to @_$tree, .5, { css: { autoAlpha: 1, y: 0 }, delay: delay + .15, ease: Cubic.easeOut }

		TweenLite.to @_$fenceLeft, .5, { css: { autoAlpha: 1, y: 0 }, delay: delay + .145, ease: Cubic.easeOut }
		TweenLite.to @_$fenceRight, .5, { css: { autoAlpha: 1, y: 0 }, delay: delay + .145, ease: Cubic.easeOut }

		delay += .1

	_startBlinking: =>
		@_blinkHuman();
		TweenLite.delayedCall .5, @_blinkDog;

	_blinkHuman: =>
		@_$eyesHuman.hide()
		TweenLite.delayedCall .25, @_showEyes, [ @_$eyesHuman ]
		TweenLite.delayedCall .5, @_hideEyes, [ @_$eyesHuman ]
		TweenLite.delayedCall .75, @_showEyes, [ @_$eyesHuman ]

		setTimeout @_blinkHuman, Math.random() * 6000 + 4000

	_showEyes: ( eyes ) =>
		eyes.show()

	_hideEyes: ( eyes ) ->
		eyes.hide()

	_blinkDog: =>
		@_$eyesDog.hide()
		TweenLite.delayedCall .25, @_showEyes, [ @_$eyesDog ]
		TweenLite.delayedCall .5, @_hideEyes, [ @_$eyesDog ]
		TweenLite.delayedCall .75, @_showEyes, [ @_$eyesDog ]

		setTimeout @_blinkDog, Math.random() * 4000 + 2000



class Clouds

	_$clouds: null
	_cloudLeft0: null
	_cloudLeft1: null
	_cloudRight0: null
	_cloudRight1: null
	_cloudRight2: null

	constructor: ->
		@_$clouds = $( "#clouds" )

		@_cloudLeft0 = new Cloud( @_$clouds.find( ".landscape__cloud--cloud3" ), 20 )
		@_cloudLeft1 = new Cloud( @_$clouds.find( ".landscape__cloud--cloud2" ), 20 )
		@_cloudRight0 = new Cloud( @_$clouds.find( ".landscape__cloud--cloud0" ), -20 )
		@_cloudRight1 = new Cloud( @_$clouds.find( ".landscape__cloud--cloud4" ), -20 )
		@_cloudRight2 = new Cloud( @_$clouds.find( ".landscape__cloud--cloud1" ), -20 )

	show: ( delay ) ->
		@_cloudLeft0.show delay
		@_cloudLeft1.show delay + .1
		@_cloudRight0.show delay + .05
		@_cloudRight1.show delay + .15
		@_cloudRight2.show delay + .075

class Cloud

	@CLOUDS = []

	$base: null

	_vy: 0
	_py: 0
	_ty: 0

	constructor: ( @$base, @px ) ->
		@_vy = Math.random() * .05 - .025
		@_vy = Math.min( @_vy, -.015 ) if @_vy < 0
		@_vy = Math.max( @_vy, .015 ) if @_vy > 0
		@_py = @_vy
		TweenLite.set @$base, { css: { x: @px, autoAlpha: 0 } }
		Cloud.CLOUDS.push @

	show: ( delay ) ->
		TweenLite.to @$base, .5, { css: { x: 0, autoAlpha: 1 }, delay: delay }
		setTimeout @_move, Math.random() * 1000
		return
	
	_move: =>
		@_py += @_vy
		@_ty = ( Math.sin( @_py ) * 10 - @_ty ) * .9
		TweenLite.set @$base, { css: { y: @_ty } }
		requestAnimationFrame @_move





