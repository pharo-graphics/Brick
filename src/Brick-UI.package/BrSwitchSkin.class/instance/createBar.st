as yet unclassified
createBar
 ^  BlElement new
		extent: 34@14;
		border: (BlBorder radius: 20);
		background: Color gray;
		constraintsDo:[:c| 
			c frame vertical alignCenter.
			c frame horizontal alignCenter]