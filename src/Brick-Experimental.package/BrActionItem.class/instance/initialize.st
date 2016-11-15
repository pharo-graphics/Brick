as yet unclassified
initialize
	super initialize.
	self styleClass: #item.
	self constraintsDo: [ :c| c linear vertical alignCenter ]