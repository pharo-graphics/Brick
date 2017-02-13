initialization
initialize
	super initialize.
	
	self subject: (MlRopeSubject new rope: (SpRope from: (String loremIpsum: 1000000)))