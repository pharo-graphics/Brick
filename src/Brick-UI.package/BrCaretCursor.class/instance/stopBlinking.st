as yet unclassified
stopBlinking
	blinking := false.
	self visibility: BlVisibility hidden.
	blinkAnimation stop