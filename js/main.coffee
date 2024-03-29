map = null





$ -> # Start this code when page is loaded
	$("input#email").val localStorage.email if localStorage.email? # Fill out the email form if users email address is already stored locally
	$('[href^="#"]').click(scrollTo) # Make pagesection links scroll

	# Leaflet map
	map = new Map()
	map.createMap()
	navigator.geolocation.getCurrentPosition(getCurrentPositionHandler) if navigator.geolocation?





getCurrentPositionHandler = (position) ->
		map.addMarker(position.coords.latitude, position.coords.longitude)
		map.fitBound([position.coords.latitude, position.coords.longitude])

class Map
	map: null
	latitude: 50.94958
	longitude: 5.34657
	zoom: 10

	createMap: () ->
		this.map = L.map('map', {scrollWheelZoom: false}).setView([this.latitude, this.longitude], this.zoom)
		L.tileLayer('http://{s}.tile.cloudmade.com/744d221a8986462c8970d7087063bd59/997/256/{z}/{x}/{y}.png', {
			attribution: 'Map &copy Cloudmade'
		}).addTo(this.map)

		this.addMarker(this.latitude, this.longitude, "<b>Viking Basis</b><br />Come and say hi!")

	addMarker: (longitude, latitude, message) ->
		marker = L.marker([longitude, latitude]).addTo(this.map)
		marker.bindPopup(message).openPopup() if message?

	fitBound: (bound) ->
		this.map.fitBounds([[this.latitude, this.longitude], bound])






scrollTo = () ->
	elementClicked = $(this).attr("href")
	destination = $(elementClicked).offset().top
	$("html:not(:animated),body:not(:animated)").animate({scrollTop: destination-20}, 500)





isValidEmail = (email) ->
	emailPattern = /// ^ 	#begin of line
	([\w.-]+)				#one or more letters, numbers, _ . or -
	@                 		#followed by an @ sign
	([\w.-]+)         		#then one or more letters, numbers, _ . or -
	\.                		#followed by a period
	([a-zA-Z.]{2,6})  		#followed by 2 to 6 letters or periods
	$ ///i            		#end of line and ignore case

	if email.match emailPattern # If email address is valid
		true
	else 
		false

showEmailError = (message) ->
	# 1. Add error message 2. Make it appear 3. When it shows, shake label
	$('label[for="email"]').append('<small class="invalid" style="display: none">'+message+'</small>') #1
	$('small.invalid').slideDown('slow', -> #2
		$('label[for="email"]').css('animation', 'shake 1s') #3
	)

window.processNewsletterForm = (form) ->
	email = form.elements['email'].value

	if isValidEmail email
		localStorage.email = email if Storage? # Store users email if local storage is supported
		true # allow form submission
	else
		noErrorMessage = true if $('label[for="email"] small.invalid').length == 0 # Check if form hasn't got an errormessage already to prevent adding multiple messages
		if noErrorMessage
			showEmailError "Dit email adres is niet geldig"
		false # stop form submission
