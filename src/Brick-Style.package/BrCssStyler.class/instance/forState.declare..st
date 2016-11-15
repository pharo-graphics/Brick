computing styles
forState: aSymbol declare: anAssoc
|aSelector|

aSelector := BrStyleLocalSelector target:self styleable.
aSymbol ifNotNil:[aSelector pseudoClasses add: (BlState fromSymbol:aSymbol)].
aSelector update.

	self styles
		add:
			(BrStyle new
				selector: aSelector;
				ordinal: (inlineOrdinalCnt := inlineOrdinalCnt +1);
				declaration:
					(BrStylePropertyDeclaration new
						property: anAssoc key;
						value: anAssoc value asBrStyleValue;
						rule: nil;
						yourself))