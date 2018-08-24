Class {
	#name : #BrCssStyler,
	#superclass : #BlAbstractStyler,
	#instVars : [
		'styleable',
		'styles',
		'styleProperties',
		'transitions',
		'children',
		'styleClasses',
		'styleId',
		'stylesheets',
		'pseudoClassStates',
		'inlineOrdinalCnt'
	],
	#classInstVars : [
		'DefaultStylesheet'
	],
	#category : 'Brick-Style-Styler'
}

{ #category : #'as yet unclassified' }
BrCssStyler class >> defaultStylesheet [
	^ DefaultStylesheet
		ifNil: [ DefaultStylesheet := BrStylesheet origin: BrStyleOrigin AUTHOR ]
]

{ #category : #'as yet unclassified' }
BrCssStyler class >> defaultStylesheet: aStylesheet [
	DefaultStylesheet := aStylesheet
]

{ #category : #'as yet unclassified' }
BrCssStyler class >> on: aStyleable [
	^ self basicNew
		styleable: aStyleable;
		initialize;
		yourself
]

{ #category : #'as yet unclassified' }
BrCssStyler class >> styleProperties [
	^ #()
]

{ #category : #'computing styles' }
BrCssStyler >> apply [
	| matchingStyles matchingTransitions |
	matchingStyles := self matchingStyleMap.
	matchingTransitions := self matchingTransitions.
	matchingStyles ifNotEmpty:
			[ self styleProperties do: [ :p | |newVal|
					newVal := nil.
					matchingStyles at: p ifPresent: [ :v | newVal := v transition: (matchingTransitions at: p ifAbsent: [ nil ])].
					self perform: p asSymbol asMutator with: newVal
					 ]].
	self children do: [ :each | each apply ].
]

{ #category : #accessing }
BrCssStyler >> children [
	^ children
]

{ #category : #accessing }
BrCssStyler >> children: anObject [
	children := anObject
]

{ #category : #private }
BrCssStyler >> compute [
	self stylesheets computeStyleNodes
]

{ #category : #'computing styles' }
BrCssStyler >> declare: anAssoc [
	self forState: nil declare: anAssoc
]

{ #category : #'computing styles' }
BrCssStyler >> forState: aSymbol declare: anAssoc [
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
]

{ #category : #'initialize-release' }
BrCssStyler >> initialize [
	super initialize.
	styles := SortedCollection sortBlock: [ :s1 :s2 | s1 <= s2 ].
	transitions := SortedCollection sortBlock: [ :t1 :t2 | t1 <= t2 ].
	children := IdentitySet new.
	inlineOrdinalCnt := 1000.
	stylesheets := BrStylesheetContainer on: self styleable. 
	pseudoClassStates := BrPseudoClassStates on: self styleable. 
	styleClasses := OrderedCollection new.
	stylesheets add: self class defaultStylesheet.
	self styleable addEventFilter: BrStyleEventListener new.
]

{ #category : #'computing styles' }
BrCssStyler >> matchingStyleMap [
	| thePseudoClassStates matchingStyles |
	thePseudoClassStates := self transitionStates.
	matchingStyles := Dictionary new.
	self styles
		select: [ :s | s matchesStyleable: self styleable pseudoClassStates: thePseudoClassStates ]
		thenDo: [ :s | matchingStyles at: s declaration property put: s declaration value ].
		
	^ matchingStyles
]

{ #category : #'computing styles' }
BrCssStyler >> matchingTransitions [
	| thePseudoClassStates matchingTrans |
	thePseudoClassStates := self transitionStates.
	matchingTrans := Dictionary new.
	self transitions
		select: [ :t | t matchesStyleable: self styleable pseudoClassStates: thePseudoClassStates ]
		thenDo: [ :t | matchingTrans at: t transition property put: t transition ].
	^ matchingTrans
]

{ #category : #accessing }
BrCssStyler >> pseudoClassStates [
	^ pseudoClassStates
]

{ #category : #accessing }
BrCssStyler >> pseudoClassStates: aPseudoClassStates [
	pseudoClassStates := aPseudoClassStates
]

{ #category : #'computing styles' }
BrCssStyler >> reload [
	stylesheets
		removeAll;
		add: self class defaultStylesheet.
	self
		compute;
		apply
]

{ #category : #accessing }
BrCssStyler >> styleClasses [
	^ styleClasses
]

{ #category : #accessing }
BrCssStyler >> styleClasses: anObject [
	styleClasses := anObject
]

{ #category : #accessing }
BrCssStyler >> styleId [
	^ styleId
]

{ #category : #accessing }
BrCssStyler >> styleId: anObject [
	styleId := anObject
]

{ #category : #accessing }
BrCssStyler >> styleProperties [
	^ styleProperties ifNil: [ styleProperties := self class styleProperties ]
]

{ #category : #accessing }
BrCssStyler >> styleable [
	^ styleable  value
]

{ #category : #accessing }
BrCssStyler >> styleable: anObject [
	anObject ifNil: [ styleable value: nil. ^ self ].
	styleable ifNil:[styleable := BlWeakRef new].
	styleable value: anObject.
	anObject styler: self
]

{ #category : #accessing }
BrCssStyler >> styles [
	^ styles
]

{ #category : #accessing }
BrCssStyler >> styles: anObject [
	styles := anObject
]

{ #category : #accessing }
BrCssStyler >> stylesheets [
	^ stylesheets
]

{ #category : #accessing }
BrCssStyler >> stylesheets: aStylesheetContainer [
	stylesheets := aStylesheetContainer
]

{ #category : #'computing styles' }
BrCssStyler >> transitionStates [
	| theStateList parent |
	theStateList := OrderedCollection new.
	parent := self styleable.
	[ parent isNotNil ]
		whileTrue: [ 
			theStateList addFirst: parent pseudoClassStates.
			parent := parent parent ].
	^ theStateList
]

{ #category : #accessing }
BrCssStyler >> transitions [
	^ transitions
]

{ #category : #accessing }
BrCssStyler >> transitions: anObject [
	transitions := anObject
]
