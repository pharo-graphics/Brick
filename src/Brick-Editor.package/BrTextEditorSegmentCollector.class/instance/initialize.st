initialization
initialize
	super initialize.
	
	interval := 0 to: 0.
	segments := OrderedCollection new.
	limit := 1000.
	subText := BrSubText text: (BrRopedText string: '') from: 0 to: 0