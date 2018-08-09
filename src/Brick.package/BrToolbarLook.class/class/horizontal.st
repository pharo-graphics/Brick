factory
horizontal
	^ self basicNew initialize
		add: (BrLayoutLook gridRow fitContent constraintsDo: [ :c | c padding: (BlInsets all: 5) ])