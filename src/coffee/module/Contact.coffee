class Contact

	_$base: null
	_$main: null
	_$btClose: null
	_$form: null
	_opened: false

	constructor: ->
		@_$base = $( "#contact" )
		@_$main = $( "#main" )
		@_$btClose = $( "#bt_close_contact" )
		@_$form = $( "#contact_form" )
		@_$success = $( "#contact_form_success" )

		@_$form.submit @_onSubmit

		TweenLite.set @_$base, { autoAlpha: 0, y: 70 }

	_onSubmit: ( e ) =>
		e.preventDefault()
		$email = @_$form.find "input[type='email']"
		$.ajax 
			type: "POST",
			url: "./save.php",
			data: { mail: $email.val() },
			dataType: "json",
			success: @_onSuccess

	_onSuccess: =>
		@_$form.hide()
		@_$success.show()

	show: ->
		return if @_opened
		@_opened = true

		@_$base.css "display", "block"
		TweenLite.set @_$base, { autoAlpha: .8 }
		TweenLite.to @_$base, .8, { css: { autoAlpha: 1, y: 0 }, ease: Cubic.easeOut }
		TweenLite.to @_$main, .7, { css: { bottom: "105px" }, delay: .05, ease: Cubic.easeOut }
		
		@_$btClose.click @_closeClickHandler

	_closeClickHandler: ( e ) =>
		e.preventDefault()
		@hide()

	hide: ->
		return if !@_opened
		@_opened = false

		@_$btClose.unbind()

		TweenLite.to @_$base, .3, { css: { autoAlpha: 0, y: 100 }, delay: .025, ease: Cubic.easeOut, onComplete: @_onHideComplete }
		TweenLite.to @_$main, .4, { css: { bottom: "0" }, ease: Cubic.easeOut }

	_onHideComplete: =>
		TweenLite.set @_$base, { autoAlpha: 0 }
		@_$base.css "display", "none"
