api
on: aStateSymbolOrArray style: aBlock
	| stateSymbols prevSelector previousSelectors selector theRule |
	
	"style classes"
	stateSymbols := aStateSymbolOrArray isSymbol
		ifTrue: [ {aStateSymbolOrArray} ]
		ifFalse: [ aStateSymbolOrArray ].
	
	"replace the prev selector by a copy with states"
	prevSelector := self selectors pop.
	"new simple selector"
	selector := prevSelector copy
		pseudoClasses: (stateSymbols collect:[:each| BlState fromSymbol:each]);
		update.
		
	"retrieve prev selectors and push the new simple selector"
	self selectors push: selector.
	previousSelectors := self selectors asArray reversed allButLast.
	
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
	
	"re-push prev selector"
	self selectors push: prevSelector.
	