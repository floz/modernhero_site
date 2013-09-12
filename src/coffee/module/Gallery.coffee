class Gallery

	_$base: null
	_$layer: null
	_$btClose: null
	_$diaporamaHolder: null
	_$diaporama: null
	_$diaporamaImgs: null
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
		@_$diaporama = $( "#gallery_diaporama" )
		@_$diaporamaImgs = @_$diaporama.find "li"
		@_$btTop = $( "#gallery_bt_top" )
		@_$pagination = $( "#gallery_pagination" )
		@_$paginationMax = $( "#gallery_pagination_max" )
		@_$btBot = $( "#gallery_bt_bot" )

		TweenLite.set @_$btClose, { autoAlpha: 0, y: -20 }

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
		@_$base.css "display", "block"
		@_$layer.css "display", "block"

		TweenLite.to @_$btClose, .4, { autoAlpha: 1, y: 0, ease: Cubic.easeOut }

		@_$btClose.click @_closeClickHandler

	_closeClickHandler: ( e ) =>
		e.preventDefault()
		@hide()

	hide: ->
		return if !@_opened
		@_opened = false
		@_$base.css "display", "none"
		@_$layer.css "display", "none"
