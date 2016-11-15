as yet unclassified
declareTransition: anAssoc
	self transitions
		add:
			(BrStyleTransitionDeclaration new
				property: anAssoc key;
				valuesFromArray: anAssoc value;
				rule: self;
				yourself)