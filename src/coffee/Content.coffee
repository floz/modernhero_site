class Content

	_$logoTitle: null
	_$logoIcon: null
	_$separatorDots: null
	_$title: null
	_$subtitle: null
	_$credits: null
	_$separatorHorizontal: null
	_previewWorld: null

	constructor: ->
		@_$logoTitle = $( "#logo_title" )
		@_$logoIcon = $( "#logo_icon" )
		@_$separatorDots = $( "#content_separator_dots" )
		@_$title = $( "#content_description_title" )
		@_$subtitle = $( "#content_description_subtitle" )
		@_$credits = $( "#content_description_credits" )
		@_$separatorHorizontal = $( "#content_separator_horizontal")
		@_previewWorld = new PreviewWorld()

		# TweenLite.set @_$logoTitle, { autoAlpha: 0, y: -20 }
		# TweenLite.set @_$logoIcon, { autoAlpha: 0, y: 20 }

		# @_$logoIcon.css
		# 	opacity: 0

		# @_$separatorDots.css
		# 	opacity: 0

		# @_$title.css
		# 	opacity: 0

		# @_$subtitle.css
		# 	opacity: 0

		# @_$credits.css
		# 	opacity: 0

		# @_$separatorHorizontal.css
		# 	opacity: 0

	show: ->
		TweenLite.to @_$separatorDots, 3, { autoAlpha: 1, delay: .2, ease: Quad.easeOut }
		TweenLite.to @_$title, 3, { autoAlpha: 1, delay: .2, ease: Quad.easeOut }
		TweenLite.to @_$subtitle, 3, { autoAlpha: 1, delay: 1.25, ease: Quad.easeOut}
		TweenLite.to @_$credits, 3, { autoAlpha: 1, delay: 2.3, ease: Quad.easeOut }

		TweenLite.to @_$separatorHorizontal, .4, { autoAlpha: 1, delay: 4.4 }

		TweenLite.to @_$logoIcon, .8, { autoAlpha: 1, y: 0, delay: 4.05 }
		TweenLite.to @_$logoTitle, .8, { autoAlpha: 1, y: 0, delay: 4.15 }

		@_previewWorld.show 4.5

class PreviewWorld

	_$banner: null
	_$bannerTitle: null
	_$diaporama: null
	_$diaporamaImgs: null
	_countImg: 0
	_$bt: null
	_$previewWorldLayer: null

	_idxImg: -1
	_currentImg: null

	constructor: ->
		@_$banner = $( "#preview_world_banner" )
		@_$bannerTitle = @_$banner.find "span"
		@_$diaporama = $( "#world_diaporama" )
		@_$diaporamaImgs = @_$diaporama.find "img"
		@_countImg = @_$diaporamaImgs.length
		@_$bt = $( "#preview_world_bt")
		@_$previewWorldLayer = $( "#preview_world_layer" )

		# TweenLite.set @_$banner, { autoAlpha: 0, scaleX: .8 }
		# TweenLite.set @_$bannerTitle, { autoAlpha: 0 }
		# TweenLite.set @_$bt, { autoAlpha: 0, y: -10 }

		@_$diaporamaImgs.css 
			opacity: 0
			visibility: "hidden"

		TweenLite.set @_$previewWorldLayer, { autoAlpha: 0 }
		@_$bt.hover @_previewOverHandler, @_previewOutHandler

		@_next()

	_previewOverHandler: ( e ) =>
		TweenLite.to @_$previewWorldLayer, .4, { autoAlpha: 1, ease: Cubic.easeOut }

	_previewOutHandler: ( e ) =>
		TweenLite.to @_$previewWorldLayer, .2, { autoAlpha: 0, ease: Cubic.easeIn }

	_next: =>
		@_idxImg++
		@_idxImg = 0 if @_idxImg > @_countImg - 1 

		newImg = @_$diaporamaImgs[ @_idxImg ]
		if @_currentImg
			$( @_currentImg ).css
				zIndex: 0
			$( newImg ).css
				zIndex: 1
			TweenLite.to newImg, .4, { autoAlpha: 1, onComplete: @_hideImg, onCompleteParams: [ @_currentImg ] }
		else
			TweenLite.set newImg, { autoAlpha: 1 }

		@_currentImg = newImg

		setTimeout @_next, 4000

	_hideImg: ( img ) ->
		TweenLite.set img, { autoAlpha: 0 }

	show: ( delay ) ->
		TweenLite.to @_$banner, .4, { autoAlpha: 1, scaleX: 1, delay: delay, ease: Back.easeOut }
		TweenLite.to @_$bannerTitle, .25, { autoAlpha: 1, delay: delay + .3 }
		TweenLite.to @_$bt, .4, { autoAlpha: 1, y: 0, delay: delay + .2 }
