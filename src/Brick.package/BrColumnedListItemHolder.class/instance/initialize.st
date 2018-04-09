initialization
initialize
	super initialize.
	
	rowShapeBlock := [ :anObject :aRowElement | aRowElement ].
	cellShapeBlock := [ BlElement new ]