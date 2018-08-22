initialization
initializeLook
	super initializeLook.
	"Ensure a progress element"
	self widgetContent 
		layout: BlFrameLayout new.
	self widgetProgress
		constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical matchParent.
				c frame horizontal weight: self percentage.
				c frame horizontal alignLeft.
				c frame vertical alignCenter ]
	