class Gallery

	_$base: null
	_$layer: null
	_$btClose: null
	_$diaporamaHolder: null
	_$diaporamaCnt: null
	_$diaporama: null
	_$diaporamaImgs: null
	_$galleryController: null
	_$btTop: null
	_$pagination: null
	_$paginationMax: null
	_$btBot: null
	_opened: false

	_idx: 0
	_idxMax: 0

	constructor: ->
		@_$base = $( "#gallery" )
		@_$layer = $( "#layer" )
		@_$btClose = $( "#bt_close_gallery" )
		@_$diaporamaHolder = $( "#gallery_diaporama_holder" )
		@_$diaporamaCnt = $( "#gallery_diaporama_cnt" )
		@_$diaporama = $( "#gallery_diaporama" )
		@_$diaporamaImgs = @_$diaporama.find "li"
		@_$galleryController = $( "#gallery_controller" )
		@_$btTop = $( "#gallery_bt_top" )
		@_$pagination = $( "#gallery_pagination" )
		@_$paginationMax = $( "#gallery_pagination_max" )
		@_$btBot = $( "#gallery_bt_bot" )

		@_idxMax = @_$diaporamaImgs.length
		@_$paginationMax.html "0" + @_idxMax

		@_$btTop.click @_topClickHandler
		@_$btBot.click @_botClickHandler

	_topClickHandler: =>
		@_idx--
		@_idx = 0 if @_idx < 0 
		@_update()

	_botClickHandler: =>
		@_idx++
		@_idx = @_idxMax - 1 if @_idx >= @_idxMax - 1
		@_update()

	_update: ->
		@_$pagination.html "0" + ( @_idx + 1 )
		TweenLite.to @_$diaporama, .5, { y: -@_idx * 478 }

	show: ->
		return if @_opened
		@_opened = true
		@_$base.show()
		@_$layer.show()

		TweenLite.set @_$layer, { css: { autoAlpha: 0 } }
		TweenLite.set @_$btClose, { css: { autoAlpha: 0, y: -20 } }
		TweenLite.set @_$diaporamaCnt, { css: { autoAlpha: 0, y: 100 } }
		TweenLite.set @_$galleryController, { css: { autoAlpha: 0, y: 100 } }

		TweenLite.to @_$layer, .4, 
			css: 
				autoAlpha: 1

		TweenLite.to @_$btClose, .17, 
			delay: .05,
			css: 
				autoAlpha: 1,
				y: -8,
			ease: Sine.easeIn
		TweenLite.to @_$btClose, .53,
			delay: .17 + .05,
			css: 
				y: 0
			ease: Back.easeOut,
			easeParams: [ 1.2 ]

		TweenLite.to @_$diaporamaCnt, .17, 
			css: 
				autoAlpha: 1,
				y: 60,
			ease: Sine.easeIn
		TweenLite.to @_$diaporamaCnt, .53,
			delay: .17,
			css: 
				y: 0
			ease: Back.easeOut,
			easeParams: [ 1.2 ]

		TweenLite.to @_$galleryController, .17, 
			delay: .15,
			css: 
				autoAlpha: 1,
				y: 60,
			ease: Sine.easeIn
		TweenLite.to @_$galleryController, .53,
			delay: .15 + .17
			css: 
				y: 0
			ease: Back.easeOut,
			easeParams: [ 1.2 ]

		@_$btClose.click @_closeClickHandler

	_closeClickHandler: ( e ) =>
		e.preventDefault()
		@hide()

	hide: ->
		return if !@_opened

		TweenLite.to @_$btClose, .3,
			css:
				autoAlpha: 0,
				y: -20
			ease: Quad.easeOut
		TweenLite.to @_$diaporamaCnt, .3,
			css:
				autoAlpha: 0,
				y: 60
			ease: Cubic.easeOut
		TweenLite.to @_$galleryController, .3,
			css:
				autoAlpha: 0,
				y: 60
			ease: Cubic.easeOut
		TweenLite.to @_$layer, .3,
			delay: .1,
			css: 
				autoAlpha: 0
			ease: Quad.easeOut,
			onComplete: @_onHideComplete

		@_opened = false

	_onHideComplete: =>
		@_$base.hide()
		@_$layer.hide()
		
