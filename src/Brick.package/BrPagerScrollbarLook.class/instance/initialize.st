initialization
initialize
	super initialize.

	pages := OrderedDictionary new.
	scrollbarElement := BlElement new.
	scrollbarElement layout: BlLinearLayout horizontal.
	scrollbarElement constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical fitContent ]