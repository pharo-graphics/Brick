demo - model and ui
view
	^ BlScalableElement new
		clipChildren: false;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ]