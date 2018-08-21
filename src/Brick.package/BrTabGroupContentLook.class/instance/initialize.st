initialization
initialize
	super initialize.

	content := BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ].
		
	contentElementsCache := IdentityDictionary new