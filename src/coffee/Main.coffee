$ ->
	new Main()

class Main

	_gallery: null
	_contact: null
	_currentModule: null

	constructor: ->
		$( "#btMenuAbout" ).click @_onAbout
		$( "#btMenuGallery" ).click @_onGallery
		$( "#btMenuContact" ).click @_onContact

		@_gallery = new Gallery()
		@_contact = new Contact()

	_onAbout: ( e ) =>
		e.preventDefault()

		@_hideCurrentModule()

	_onGallery: ( e ) =>
		e.preventDefault()

		@_hideCurrentModule()
		@_gallery.show()
		@_currentModule = @_gallery

	_onContact: ( e ) =>
		e.preventDefault()

		@_hideCurrentModule()
		@_contact.show()
		@_currentModule = @_contact

	_hideCurrentModule: ->
		return if !@_currentModule
		@_currentModule.hide()