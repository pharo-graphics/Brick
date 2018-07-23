initialization
initializeLook
	super initializeLook.

	self labelDo: [ :anElement | anElement constraintsDo: [ :c | c horizontal matchParent ] ]