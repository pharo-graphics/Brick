as yet unclassified
computedStyles
	^ self declarations
		collect: [ :d | 
			BrStyle new
				selector: self selector;
				declaration: d;
				conditions: self conditions;
				yourself ]