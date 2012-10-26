$ -> # Start this code when page is loaded
	if localStorage.email? # If users email address is already stored locally
		$("input#email").val localStorage.email # Fill out the email form

	$('[href^="#"]').click(()-> # Make links to page sections scroll
	   elementClicked = $(this).attr("href")
	   destination = $(elementClicked).offset().top
	   $("html:not(:animated),body:not(:animated)").animate({scrollTop: destination-20}, 500)
	   return false
	)

isValidEmail = (email) ->
	emailPattern = /// ^ 	#begin of line
	([\w.-]+)				#one or more letters, numbers, _ . or -
	@                 		#followed by an @ sign
	([\w.-]+)         		#then one or more letters, numbers, _ . or -
	\.                		#followed by a period
	([a-zA-Z.]{2,6})  		#followed by 2 to 6 letters or periods
	$ ///i            		#end of line and ignore case

	if email.match emailPattern # If email address is valid
		return true
	else 
		return false

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
