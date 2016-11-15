as yet unclassified
createMark
	^ (BlEllipse diameter: 10) asElement
		styleClass: #mark;
		background: Color black;
		constraintsDo:[:c| 
			c frame vertical alignCenter.
			c frame horizontal alignCenter ]