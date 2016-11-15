api
cls: aSymbolOrArray style: aBlock
	| symbArray previousSelectors selector theRule |
	
	"style classes"
	symbArray := aSymbolOrArray isSymbol
		ifTrue: [ {aSymbolOrArray} ]
		ifFalse: [ aSymbolOrArray ].
		
	"new simple selector"
	selector := BrStyleSimpleSelector new
		styleClasses: symbArray;
		update.
		
	"push simple selector"
	self selectors push: selector.
	previousSelectors := self selectors asArray reversed.
	
	"if there are previous selector, create a compound selector with CHILD relation"
		previousSelectors size > 1 ifTrue: [ 
			selector := BrStyleCompoundSelector 
				selectors: previousSelectors relationships: 
					(Array streamContents:[:s| previousSelectors size - 1 timesRepeat:[s nextPut: BrStyleRelation CHILD]]).
			selector update].	
	
	"create the rule for the target stylesheet"
	theRule := BrStyleRule new.
	theRule
		selectors: {selector};
		stylesheet: self stylesheet.
	
	"push and store the rule in stylesheet"
	self stylesheet rules add: theRule.
	self rules push:theRule.
	
	"execute aBlock on the builder"
	aBlock value: self.
	
	"pop all"
	self selectors pop.
	self rules pop.
	