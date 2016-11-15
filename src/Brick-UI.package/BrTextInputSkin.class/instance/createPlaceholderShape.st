initialization
createPlaceholderShape
	^ BlText new
		styleClass: #placeholder;
		constraintsDo: [ :c |  c  hMatchParent; alignTopLeft ]