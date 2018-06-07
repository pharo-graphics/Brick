initialization
createSegmentElement
	"Create and return an that should represent a segment that I will hold.
	An element can be any of `BlElement withAllSubclasses`"
	<return: #BlElement>
	
	^ BlElement new
		layout: BlLinearLayout vertical;
		background: Color veryVeryLightGray;
		geometry: (BlRectangle cornerRadius: 10);
		padding: (BlInsets top: 20 left: 8 bottom: 8 right: 8);
		focusability: BlFocusability after;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ];
		yourself