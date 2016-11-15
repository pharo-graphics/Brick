initialization
initializeWithColorNamed: aColorName
	super initializeWithColorNamed: aColorName.
	
	self backgroundColor: (BrMdColor color: aColorName intensity: 100).
	self borderColor: (BrMdColor color: aColorName intensity: 200).
	self textColor: BrMdColor grey900.
	
	self hovered
		backgroundColor: (BrMdColor color: aColorName intensity: 200).
	
	self pressed
		backgroundColor: (BrMdColor color: aColorName intensity: 300);
		borderColor: (BrMdColor color: aColorName intensity: 300).
		
	self icon backgroundColor: BrMdColor grey900.