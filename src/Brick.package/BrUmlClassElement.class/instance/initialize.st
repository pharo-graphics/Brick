initialization
initialize
	super initialize.
	
	self size: 200@300.
	self layout: BlLinearLayout vertical.
	self border: (BlBorder paint: Color black width: 1)