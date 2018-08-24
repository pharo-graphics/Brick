Class {
	#name : #BrStylesheetBuilder,
	#superclass : #Object,
	#instVars : [
		'stylesheet',
		'rules',
		'selectors'
	],
	#category : 'Brick-Style-Util'
}

{ #category : #'instance creation' }
BrStylesheetBuilder class >> on: aStylesheet [
	^ self new stylesheet: aStylesheet
]

{ #category : #api }
BrStylesheetBuilder >> cls: aSymbolOrArray style: aBlock [
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
	
]

{ #category : #api }
BrStylesheetBuilder >> declare: anAssociation [
	"[usage] declare: #background -> Color red"
	self rules top declare: anAssociation
]

{ #category : #api }
BrStylesheetBuilder >> declare: anAssociation important: aBoolean [
	self rules top declare: anAssociation important: aBoolean
]

{ #category : #api }
BrStylesheetBuilder >> declareTransition: anAssociation [
	"[def] declareTransition: #property ->{duration. timingFn. delay }
	[usage] declareTransition: #background ->{100 asBrMs. #linear. 100 asBrMs }"

	self rules top declareTransition: anAssociation
]

{ #category : #initialization }
BrStylesheetBuilder >> initialize [
	super initialize.
	rules := Stack new.
	selectors := Stack new
]

{ #category : #api }
BrStylesheetBuilder >> on: aStateSymbolOrArray style: aBlock [
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
	
]

{ #category : #accessing }
BrStylesheetBuilder >> rules [
	^ rules
]

{ #category : #accessing }
BrStylesheetBuilder >> rules: anObject [
	rules := anObject
]

{ #category : #accessing }
BrStylesheetBuilder >> selectors [
	^ selectors
]

{ #category : #accessing }
BrStylesheetBuilder >> selectors: anObject [
	selectors := anObject
]

{ #category : #accessing }
BrStylesheetBuilder >> stylesheet [
	^ stylesheet
]

{ #category : #accessing }
BrStylesheetBuilder >> stylesheet: anObject [
	stylesheet := anObject
]
