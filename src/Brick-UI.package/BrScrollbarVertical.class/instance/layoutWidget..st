as yet unclassified
layoutWidget: aWidget
	^ aWidget constraintsDo: [ :c | c vertical matchParent ]