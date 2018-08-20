initialization
initialize
	super initialize.
	
	self
		fontSize: 14;
		weight: 400;
		foreground: (Color black alpha: 0.65);
		fontName: 'Source Sans Pro'.
		
	self labelDo: [ :aLabelElement | aLabelElement boundsBaseline ]