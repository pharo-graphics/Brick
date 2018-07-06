initialization
initialize
	super initialize.
	
	interval := 0 to: 0.
	segments := OrderedCollection new.
	self flag: 'This limit has to be rethought, once the lazy loading of new segments is implemented'.
	limit := SmallInteger maxVal.
	subText := BlSubText text: '' asRopedText from: 0 to: 0