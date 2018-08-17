initialization
initialize
	super initialize.

	pages := OrderedDictionary new.
	scrollbarElement := BlElement new.
	scrollbarElement margin: (BlInsets top: 5).
	scrollbarElement layout: BlLinearLayout horizontal alignCenter.
	scrollbarElement constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical fitContent ]