initialization
initializeLook
	super initializeLook.
	
	self widget background: (Color gray alpha: 0.5).
	self widget geometry: (BlRectangle cornerRadius: 2).
	self widget constraintsDo: [ :c |
		c ignoreByLayout.
		c vertical exact: 4.
		c horizontal exact: 70.
		c ignored vertical alignBottom.
		c ignored horizontal alignCenter.
		c margin: (BlInsets bottom: 4) ]