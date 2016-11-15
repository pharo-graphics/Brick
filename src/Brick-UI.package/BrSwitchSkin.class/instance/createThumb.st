as yet unclassified
createThumb
 ^ (BlEllipse diameter: 20) asElement
		background: Color darkGray;
		constraintsDo:[:c| 
			c frame vertical alignCenter.
			c frame horizontal alignLeft ]