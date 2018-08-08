factory
vertical
	^ self basicNew initialize
		add: (BrLayoutLook gridColumn fitContent constraintsDo: [ :c | c padding: (BlInsets all: 5) ])