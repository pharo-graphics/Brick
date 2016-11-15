as yet unclassified
layoutWidget: aWidget
	^ aWidget constraintsDo: [ :c | c horizontal matchParent ]