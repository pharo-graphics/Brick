Class {
	#name : #BrStyleSelector,
	#superclass : #Object,
	#instVars : [
		'rule',
		'specificity',
		'matchOnId',
		'matchOnName',
		'matchOnStyleClass'
	],
	#category : 'Brick-Style-CSS'
}

{ #category : #'as yet unclassified' }
BrStyleSelector class >> from: anObject [
	anObject isSymbol
		ifTrue: [ ^ self fromSymbol: anObject ].
	(anObject isArray and: [ anObject size = 1 ])
		ifTrue: [ ^ self fromSymbol: anObject first ].
	anObject isArray
		ifTrue: [ ^ self fromSymbols: anObject ]
]

{ #category : #'instance creation' }
BrStyleSelector class >> fromDescSymbols: aSymbolList [
	| selectors relationships |
	selectors := OrderedCollection new.
	relationships := OrderedCollection new.
	aSymbolList
		do:
			[ :aSymb |  aSymb = #>
				ifTrue: [ relationships add: BrStyleRelation CHILD ]
				ifFalse: [ 
					(aSymb = aSymbolList first) not
						ifTrue: [ relationships add: BrStyleRelation DESCENDANT ].
					selectors add: (self fromSymbol: aSymb) ] ].
			
	^ (BrStyleCompoundSelector selectors: selectors relationships: relationships)
		update;
		yourself
]

{ #category : #'as yet unclassified' }
BrStyleSelector class >> fromSymbol: aSymbol [
	| parts selector |
	parts := BlStyleHelper splitSelectorSymbol: aSymbol.
	selector := BrStyleSimpleSelector new
		name: nil;
		styleClasses: {parts first asSymbol};
		id: nil;
		yourself.
	parts size > 1
		ifTrue:
			[ 
			selector pseudoClasses
				addAll: (parts allButFirst collect: [ :each | BlState fromSymbol: each asSymbol ]) ].
	selector update.
	^ selector
]

{ #category : #'instance creation' }
BrStyleSelector class >> fromSymbols: aSymbolList [
	| selectors relationships |
	selectors := OrderedCollection new.
	relationships := OrderedCollection new.
	aSymbolList
		do:
			[ :aSymb |  aSymb = #>
				ifTrue: [ relationships add: BrStyleRelation CHILD ]
				ifFalse: [ 
					(aSymb = aSymbolList first) not
						ifTrue: [ relationships add: BrStyleRelation DESCENDANT ].
					selectors add: (self fromSymbol: aSymb) ] ].
			
	^ (BrStyleCompoundSelector selectors: selectors relationships: relationships)
		update;
		yourself
]

{ #category : #testing }
BrStyleSelector >> isSimpleSelector [
	^ false
]

{ #category : #testing }
BrStyleSelector >> matchesOnId [
	^ matchOnId
]

{ #category : #testing }
BrStyleSelector >> matchesOnName [
	^ matchOnName 
]

{ #category : #testing }
BrStyleSelector >> matchesOnStyleClass [ 
	^ matchOnStyleClass 
]

{ #category : #testing }
BrStyleSelector >> matchesStyleable: aStyleable [
	self subclassResponsibility 
]

{ #category : #testing }
BrStyleSelector >> matchesStyleable: aStyleable pseudoClassStates: aPseudoClassStateList [
	self subclassResponsibility 
]

{ #category : #testing }
BrStyleSelector >> matchesStyleable: aStyleable pseudoClassStates: aPseudoClassStateList selectorIndex: aSelectorIndex [
	self subclassResponsibility 
]

{ #category : #accessing }
BrStyleSelector >> origin [
	^ self rule origin
]

{ #category : #accessing }
BrStyleSelector >> rule [
	^ rule
]

{ #category : #accessing }
BrStyleSelector >> rule: anObject [
	rule := anObject
]

{ #category : #accessing }
BrStyleSelector >> specificity [
	^ specificity
]

{ #category : #updating }
BrStyleSelector >> update [
	self updateMatching.
	self updateSpecificity 
]

{ #category : #updating }
BrStyleSelector >> updateMatching [
	self subclassResponsibility 
]

{ #category : #updating }
BrStyleSelector >> updateSpecificity [
	self subclassResponsibility
]
