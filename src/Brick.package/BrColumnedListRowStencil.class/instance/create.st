api - instantiation
create
	^ BlElement new
		layout: BlLinearLayout new;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ]