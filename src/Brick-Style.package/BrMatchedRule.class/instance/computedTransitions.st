as yet unclassified
computedTransitions
	^ self transitions
		collect: [ :t | BrStyleTransition new
				selector: self selector;
				transition: t;
				yourself ]