initialization
initializeWithColorNamed: aColorName
	super initializeWithColorNamed: aColorName.
	
	self backgroundColor: (BrMdColor color: aColorName intensity: 700).
	self borderColor: (BrMdColor color: aColorName intensity: 800).
	self text color: BrMdColor white.
	
	self hovered 
		backgroundColor: (BrMdColor color: aColorName intensity: 800).
	
	self pressed 
		backgroundColor: (BrMdColor color: aColorName intensity: 900);
		borderColor: (BrMdColor color: aColorName intensity: 900).
		
	self icon backgroundColor: BrMdColor white.