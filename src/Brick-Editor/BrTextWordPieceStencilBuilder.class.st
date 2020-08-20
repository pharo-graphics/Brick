Class {
	#name : #BrTextWordPieceStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'wordPadding',
		'wordMargin',
		'segmentPiece',
		'shouldUsePool'
	],
	#category : #'Brick-Editor-UI - Stencils'
}

{ #category : #'private - pool' }
BrTextWordPieceStencilBuilder >> acquire [
	<return: #BrTextElementWithCursors or: nil>
	
	shouldUsePool
		ifFalse: [ ^ nil ].
	
	^ self pool acquire
]

{ #category : #'api - instantiation' }
BrTextWordPieceStencilBuilder >> buildDefault [
	| aTextElement |
	
	aTextElement := (self acquire ifNil: [ self createWordElement ])
		segmentPiece: self segmentPiece;
		padding: self wordPadding;
		margin: self wordMargin.
		
	aTextElement userData at: #editorPool put: self pool.

	self reset.
	
	^ aTextElement
]

{ #category : #'api - instantiation' }
BrTextWordPieceStencilBuilder >> createWordElement [
	<return: #BrTextElementWithCursors>

	^ self subclassResponsibility
]

{ #category : #initialization }
BrTextWordPieceStencilBuilder >> initialize [
	super initialize.
	
	self reset
]

{ #category : #'api - instantiation' }
BrTextWordPieceStencilBuilder >> paramsOn: aStencilExecutor [
	aStencilExecutor push: self segmentPiece
]

{ #category : #'private - pool' }
BrTextWordPieceStencilBuilder >> pool [
	^ self subclassResponsibility
]

{ #category : #'private - pool' }
BrTextWordPieceStencilBuilder >> recycle: aPieceElement [
	aPieceElement removeFromParent.
	aPieceElement removeCursors.
	aPieceElement selectNone.

	"otherwise attributes may not be garbage collected
	see https://github.com/feenkcom/gtoolkit/issues/537"
	aPieceElement removeSegmentPiece.

	aPieceElement userData
		at: #editorPool
		ifPresent: [ :aPool | aPool == self pool ifTrue: [ self pool release: aPieceElement  ] ]
]

{ #category : #initialization }
BrTextWordPieceStencilBuilder >> reset [
	wordPadding := BlInsets empty.
	wordMargin := BlInsets empty.
	segmentPiece := nil.
	shouldUsePool := true
]

{ #category : #accessing }
BrTextWordPieceStencilBuilder >> segmentPiece [
	<return: #TBrTextEditorTextualPiece>

	^ segmentPiece
]

{ #category : #accessing }
BrTextWordPieceStencilBuilder >> segmentPiece: aTBrTextEditorTextualPiece [
	segmentPiece := aTBrTextEditorTextualPiece
]

{ #category : #accessing }
BrTextWordPieceStencilBuilder >> shouldUsePool [
	^ shouldUsePool
]

{ #category : #accessing }
BrTextWordPieceStencilBuilder >> shouldUsePool: aBoolean [
	shouldUsePool := aBoolean
]

{ #category : #accessing }
BrTextWordPieceStencilBuilder >> wordMargin [
	<return: #BlInsets>

	^ wordMargin
]

{ #category : #accessing }
BrTextWordPieceStencilBuilder >> wordMargin: aBlInsets [
	wordMargin := aBlInsets
]

{ #category : #accessing }
BrTextWordPieceStencilBuilder >> wordPadding [
	<return: #BlInsets>

	^ wordPadding
]

{ #category : #accessing }
BrTextWordPieceStencilBuilder >> wordPadding: aBlInsets [
	wordPadding := aBlInsets
]
