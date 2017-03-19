mouse handlers
clickEvent: anEvent
	"If I get click event it means that it was not handled by any editable elements"
	
	'Clicked outside' logCr.
	
	anEvent consumed: true