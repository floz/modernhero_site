$ ->
	main = new Main()
	main.show()

class Main

	_background: null
	_landscape: null
	_content: null
	_menu: null 

	_gallery: null
	_contact: null
	_currentModule: null

	constructor: ->
		$( "#btMenuAbout" ).click @_onAbout
		$( "#btMenuGallery" ).click @_onGallery
		$( "#btMenuContact" ).click @_onContact

		@_background = new Background()
		@_landscape = new Landscape()
		@_content = new Content()
		@_menu = new Menu()

		# modules
		@_gallery = new Gallery()
		@_contact = new Contact()

	show: ->
		@_content.show()
		@_background.show 3
		@_landscape.show 4.25
		@_menu.show 4.3

	_onAbout: ( e ) =>
		e.preventDefault()

		@_hideCurrentModule()

	_onGallery: ( e ) =>
		return if @_currentModule == @gallery

		e.preventDefault()

		@_hideCurrentModule()
		@_gallery.show()
		@_currentModule = @_gallery

	_onContact: ( e ) =>
		return if @_currentModule == @_contact && @_currentModule._opened

		e.preventDefault()

		@_hideCurrentModule()
		@_contact.show()
		@_currentModule = @_contact

	_hideCurrentModule: ->
		return if !@_currentModule
		@_currentModule.hide()