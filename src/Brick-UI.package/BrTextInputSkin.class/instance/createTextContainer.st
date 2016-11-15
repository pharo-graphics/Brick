initialization
createTextContainer
	^ BlElement new
		layout: BlFrameLayout new;
		constraintsDo:[:c| c vhFitContent]