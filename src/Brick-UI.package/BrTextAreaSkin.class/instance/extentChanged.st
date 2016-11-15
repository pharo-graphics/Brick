change reporting
extentChanged
	super extentChanged.
	widget isWrapText ifTrue: [ 
		text wrappingWidth: self wrappingWidth].
	
	
	