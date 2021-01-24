"
! Adornments

I am an attribute which when applied on a text visually replaces some parts of it with other items (not neccessarily character). Such attribtues requires complex text rendering system and currently only supported by the Moldable Editor.

See ${class:BrTextEditorAdornmentsExamples}$
"
Class {
	#name : #BrTextAdornmentAttribute,
	#superclass : #BlTextAttribute,
	#instVars : [
		'shouldAppend',
		'renderingStrategy',
		'cache'
	],
	#category : #'Brick-Editor-Attributes'
}

{ #category : #accessing }
BrTextAdornmentAttribute >> affect: aTBrTextEditorTextualPiece in: anEditorElement [
	"Return an element that should affect (either append or replace) a provided text piece"
	<return: #SequenceableCollection of: #BlElement>
	
	^ self cache ifAbsentPut: [ self renderingStrategy affect: aTBrTextEditorTextualPiece in: anEditorElement ]
]

{ #category : #accessing }
BrTextAdornmentAttribute >> beAppend [
	shouldAppend := true
]

{ #category : #accessing }
BrTextAdornmentAttribute >> beLazy [
	self renderingStrategy: BrTextAdornmentAttributeTaskItRenderingStrategy new.
]

{ #category : #accessing }
BrTextAdornmentAttribute >> beReplace [
	shouldAppend := false
]

{ #category : #accessing }
BrTextAdornmentAttribute >> beSync [
	self renderingStrategy: BrTextAdornmentAttributeSyncRenderingStrategy new.
]

{ #category : #'api - cache' }
BrTextAdornmentAttribute >> cache [
	<return: #BrTextAdornmentAttributeCache>

	^ cache
]

{ #category : #'api - cache' }
BrTextAdornmentAttribute >> cache: aBrTextAdornmentAttributeCache [
	cache := aBrTextAdornmentAttributeCache
]

{ #category : #accessing }
BrTextAdornmentAttribute >> doAffect: aTBrTextEditorTextualPiece in: anEditorElement [
	"Return an element that should affect (either append or replace) a provided text piece"
	<return: #SequenceableCollection of: #BlElement>

	^ self subclassResponsibility
]

{ #category : #initialization }
BrTextAdornmentAttribute >> initialize [
	super initialize.
	
	shouldAppend := false.
	self renderingStrategy: BrTextAdornmentAttributeSyncRenderingStrategy new.
	cache := BrTextAdornmentAttributeNoCache uniqueInstance
]

{ #category : #initialization }
BrTextAdornmentAttribute >> initializeLazyElement: aBlLazyElement [
	"Subclasses can initialize the element"
]

{ #category : #testing }
BrTextAdornmentAttribute >> isAdornment [
	"Return true if attribute influences text structure, for examples if it replaces one or more characters
	with any amount of other arbitrary items, false otherwise"
	<return: #Boolean>

	^ true
]

{ #category : #testing }
BrTextAdornmentAttribute >> isFocusable [
	"Return true if an element (but not its children) created by the adornment attribute can be focused"
	<return: #Boolean>

	^ false
]

{ #category : #testing }
BrTextAdornmentAttribute >> isStyle [
	"I am not a text style related attribute"

	^ false
]

{ #category : #private }
BrTextAdornmentAttribute >> newPooledCache [
	^ BrTextAdornmentAttributePooledCache new
]

{ #category : #accessing }
BrTextAdornmentAttribute >> renderingStrategy [
	<return: #BrTextAdornmentAttributeRenderingStrategy>
	^ renderingStrategy
]

{ #category : #accessing }
BrTextAdornmentAttribute >> renderingStrategy: aBrTextAdornmentAttributeRenderingStrategy [
	self 
		assert: [ aBrTextAdornmentAttributeRenderingStrategy isNotNil ] 
		description: [ 'Text attribute rendering strategy must be non-nil' ].
	aBrTextAdornmentAttributeRenderingStrategy attribute: self.
	renderingStrategy := aBrTextAdornmentAttributeRenderingStrategy
]

{ #category : #testing }
BrTextAdornmentAttribute >> shouldAppend [
	^ shouldAppend
]

{ #category : #testing }
BrTextAdornmentAttribute >> shouldReplace [
	^ shouldAppend not
]

{ #category : #printing }
BrTextAdornmentAttribute >> storeOn: aStream [
	super storeOn: aStream.
	
	aStream nextPutAll: ' '.
	aStream nextPutAll: (shouldAppend
		ifTrue: [ #beAppend ]
		ifFalse: [ #beReplace ]) asString
]

{ #category : #comparing }
BrTextAdornmentAttribute >> type [
	^ self
]

{ #category : #'api - cache' }
BrTextAdornmentAttribute >> withCache: aDictionary key: aKey [
	self cache: (aDictionary
		at: aKey
		ifAbsentPut: [ self newPooledCache ])
]

{ #category : #'api - cache' }
BrTextAdornmentAttribute >> withCache: anObject selector: aSelectorSymbol [
	(anObject perform: aSelectorSymbol withArguments: #())
		ifNil: [
			| aNewCache |
			
			aNewCache := self newPooledCache.
			anObject perform: aSelectorSymbol asMutator withArguments: { aNewCache }.
			self cache: aNewCache ]
		ifNotNil: [ :aCache | self cache: aCache ]
]

{ #category : #'api - cache' }
BrTextAdornmentAttribute >> withCacheGet: aGetBlock set: aSetBlock [
	aGetBlock value
		ifNil: [
			| aNewCache |
			
			aNewCache := self newPooledCache.
			aSetBlock value: aNewCache.
			self cache: aNewCache ]
		ifNotNil: [ :aCache | self cache: aCache ]
]

{ #category : #'api - cache' }
BrTextAdornmentAttribute >> withoutCache [
	self cache: BrTextAdornmentAttributeNoCache uniqueInstance
]
