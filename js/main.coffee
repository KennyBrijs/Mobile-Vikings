$ -> # Start this code when page is loade
	$("input#email").val localStorage.email if localStorage.email? # Fill out the email form if users email address is already stored locally
	$('[href^="#"]').click(scrollTo) # Make pagesection links scroll

	# Leaflet map
	map = createMap()
	addMarker(map)


# map =
# 	location: [50.94958, 5.34657]

createMap = () ->
	map = L.map('map').setView([50.94958, 5.34657], 10)
	L.tileLayer('http://{s}.tile.cloudmade.com/744d221a8986462c8970d7087063bd59/997/256/{z}/{x}/{y}.png', {
		attribution: 'Map &copy Cloudmade',
		maxZoom: 18
	}).addTo(map)
	map

addMarker = (map) ->
	marker = L.marker([50.94958, 5.34657]).addTo(map)
	marker
	

scrollTo = () ->
	elementClicked = $(this).attr("href")
	destination = $(elementClicked).offset().top
	$("html:not(:animated),body:not(:animated)").animate({scrollTop: destination-20}, 500)
	false

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
		if Storage? # If local storage is supported
			localStorage.email = email #store users email
		true # allow form submission
	else
		noErrorMessage = true if $('label[for="email"] small.invalid').length == 0 # Check if form hasn't got an errormessage already to prevent adding multiple messages
		if noErrorMessage
			showEmailError "Dit email adres is niet geldig"
		false # stop form submission
