initialization
initialize
	super initialize.
	
	interval := 0 to: 0.
	segments := OrderedCollection new.
	limit := 500.
	subText := BrSubText text: (BrRopedText string: '') from: 0 to: 0