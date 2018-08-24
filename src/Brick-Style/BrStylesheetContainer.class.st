Class {
	#name : #BrStylesheetContainer,
	#superclass : #OrderedCollection,
	#instVars : [
		'styleable'
	],
	#category : 'Brick-Style-Util'
}

{ #category : #'as yet unclassified' }
BrStylesheetContainer class >> on: aStyleable [
	^ self new
		styleable: aStyleable;
		yourself
]

{ #category : #'adding/removing' }
BrStylesheetContainer >> add: aStylesheet [
	super add: aStylesheet.
	
]

{ #category : #'adding/removing' }
BrStylesheetContainer >> addAll: aCollection [
	super addAll: aCollection.
]

{ #category : #'as yet unclassified' }
BrStylesheetContainer >> computeStyleNodes [
	^ self computeStyleNodesFrom: self styleable
]

{ #category : #'as yet unclassified' }
BrStylesheetContainer >> computeStyleNodesFrom: aNode [
	| aStylesheetList parent |
	aStylesheetList := OrderedCollection new.
	parent := aNode parent.
	[ parent isNotNil ] whileTrue: [ 
		aStylesheetList addAll: parent stylesheets.
		parent := parent parent ].
	^ self computeStyleNodesFrom: aNode stylesheets: aStylesheetList ordinal: 0.
]

{ #category : #'as yet unclassified' }
BrStylesheetContainer >> computeStyleNodesFrom: aStyleable stylesheets: aStylesheetList [
	| rootNode matchedRules |
	matchedRules := SortedCollection sortBlock: [ :r1 :r2 | r1 specificity <= r2 specificity ].
	aStylesheetList addAll: aStyleable stylesheets.
	aStylesheetList do: [ :eachStylesheet | matchedRules addAll: (eachStylesheet matchingRulesFor: aStyleable) ].
	rootNode := aStyleable styler.
	matchedRules do: [ :r | 
			rootNode styles addAll: (r computedStyles reject: [ :s | rootNode styles includes: s ]).
			rootNode transitions addAll: (r computedTransitions reject: [ :t | rootNode transitions includes: t ]) ].
	aStyleable isParent ifTrue:[
		aStyleable children do: [ :eachChild | rootNode children add: (self computeStyleNodesFrom: eachChild stylesheets: aStylesheetList) ]].
	^ rootNode
]

{ #category : #'as yet unclassified' }
BrStylesheetContainer >> computeStyleNodesFrom: aStyleable stylesheets: aStylesheetList ordinal: anInteger [
	| styler matchedRules ordinal |
	ordinal := anInteger.
	matchedRules := SortedCollection sortBlock: [ :r1 :r2 | r1 specificity <= r2 specificity ].
	aStylesheetList addAll: aStyleable stylesheets.
	aStylesheetList do: [ :eachStylesheet | matchedRules addAll: (eachStylesheet matchingRulesFor: aStyleable) ].
	styler := aStyleable styler.
	matchedRules do: [ :r | 
			styler styles addAll:
				((r computedStyles do:[:s| s ordinal: (ordinal := ordinal +1) ]) 
					reject: [ :s | styler styles includes: s ]).
			styler transitions addAll:
				((r computedTransitions do:[:s| s ordinal: (ordinal := ordinal +1) ])
					reject: [ :t | styler transitions includes: t ]) ].
	
	aStyleable isParent ifTrue:[
		aStyleable children do: [ :eachChild | 
			styler children add: 
				(self computeStyleNodesFrom: eachChild stylesheets: aStylesheetList ordinal:ordinal) ]].
	^ styler
]

{ #category : #'as yet unclassified' }
BrStylesheetContainer >> initialize [
	super initialize.
	super add: (BrStylesheet origin: BrStyleOrigin USER).
]

{ #category : #'adding/removing' }
BrStylesheetContainer >> remove: aStylesheet [
	super remove: aStylesheet.
]

{ #category : #'adding/removing' }
BrStylesheetContainer >> removeAll [
	super removeAll.
]

{ #category : #'adding/removing' }
BrStylesheetContainer >> removeAll: aCollection [
	super removeAll: aCollection.
]

{ #category : #accessing }
BrStylesheetContainer >> styleable [
	^ styleable
]

{ #category : #accessing }
BrStylesheetContainer >> styleable: anObject [
	styleable := anObject
]

{ #category : #'as yet unclassified' }
BrStylesheetContainer >> userStylesheet [
	^ self first
]
