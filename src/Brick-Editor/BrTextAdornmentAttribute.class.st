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
		'renderingStrategy'
	],
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #accessing }
BrTextAdornmentAttribute >> affect: aTBrTextEditorTextualPiece in: anEditorElement [
	"Return an element that should affect (either append or replace) a provided text piece"
	<return: #SequenceableCollection of: #BlElement>

	^ self renderingStrategy affect: aTBrTextEditorTextualPiece in: anEditorElement
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
	^ false
]

{ #category : #testing }
BrTextAdornmentAttribute >> isStyle [
	^ false
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
