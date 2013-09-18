$ ->
	main = new Main()
	main.show()

class Main

	_background: null
	_landscape: null
	_content: null
	_menu: null 
	_$share: null

	_gallery: null
	_contact: null
	_currentModule: null

	constructor: ->
		$( "#btMenuGallery" ).click @_onGallery
		$( "#btMenuContact" ).click @_onContact
		$( "#preview_world_bt" ).click @_onGallery
		$( "#bt_share--facebook" ).click @_onFacebookClick
		$( "#bt_share--twitter" ).click @_onTwitterClick

		@_background = new Background()
		@_landscape = new Landscape()
		@_content = new Content()
		@_menu = new Menu()

		@_$share = $( "#share" );
		TweenLite.set @_$share, { css: { autoAlpha: 0, y: -50 } }

		# modules
		@_gallery = new Gallery()
		@_contact = new Contact()

	show: ->
		@_content.show()
		@_background.show 3
		@_landscape.show 4.25
		@_menu.show 4.3

		TweenLite.to @_$share, .2,
			delay: 4.4
			css: 
				autoAlpha: .8
				y: -20
			ease: Sine.easeIn
		TweenLite.to @_$share, .4, 
			delay: 4.6
			css: 
				autoAlpha: 1
				y: 0
			ease: Cubic.easeOut

		return

	_onGallery: ( e ) =>
		return if @_currentModule == @gallery

		e.preventDefault()

		@_hideCurrentModule()
		@_gallery.show()
		@_currentModule = @_gallery
		return

	_onContact: ( e ) =>
		return if @_currentModule == @_contact && @_currentModule._opened

		e.preventDefault()

		@_hideCurrentModule()
		@_contact.show()
		@_currentModule = @_contact
		return

	_onFacebookClick: ( e ) =>
		window.open "http://www.facebook.com/sharer.php?u="+encodeURIComponent( location.href )+"&t="+encodeURIComponent(document.title), "Share us on facebook", "toolbar=0,status=0,width=548,height=325"
		false

	_onTwitterClick: ( e ) =>
		description = "Discover ModernHero, an amazing iOS mobile game!"
		window.open "https://twitter.com/home?status=" + encodeURIComponent( description ) + " - " + encodeURIComponent( location.href ) + " - " + encodeURIComponent( "@modernhero_game" ), "Share us on twitter", "toolbar=0,status=0,width=548,height=325"
		false

	_hideCurrentModule: ->
		return if !@_currentModule
		@_currentModule.hide()
		return