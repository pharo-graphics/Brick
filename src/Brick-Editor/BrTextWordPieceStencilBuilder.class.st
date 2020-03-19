Class {
	#name : #BrTextWordPieceStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'wordPadding',
		'wordMargin',
		'segmentPiece',
		'shouldUsePool'
	],
	#classVars : [
		'TextPiecePool'
	],
	#category : #'Brick-Editor-UI - Stencils'
}

{ #category : #'class initialization' }
BrTextWordPieceStencilBuilder class >> cleanUp [
	self initialize
]

{ #category : #'class initialization' }
BrTextWordPieceStencilBuilder class >> initialize [
	TextPiecePool := BlSynchronizedObjectPool pool: (BlBagObjectPool new: 1000)
]

{ #category : #'api - instantiation' }
BrTextWordPieceStencilBuilder >> acquire [
	| anAcquiredElement |
	
	^ (shouldUsePool and: [ (anAcquiredElement := TextPiecePool acquire) isNotNil ])
		ifTrue: [ anAcquiredElement ]
		ifFalse: [
			BrTextElementWithCursors new
				editorMeasurement;

				"to support event-handling attributes"
				addEventHandler: BrTextEditorLineSegmentTextListener uniqueInstance;

				"editor requests to show a cursor as a result of its position change"
				addEventHandler: BrTextWordPieceShowCursorHandler uniqueInstance;

				"editor requests to remove a cursor as a result of its position change"
				addEventHandler: BrTextWordPieceHideCursorHandler uniqueInstance;
				
				"for screen position to cursor index transformation"
				addEventHandler: BrTextWordPieceScreenToCursorHandler uniqueInstance;

				addEventHandler: BrTextWordPieceFocusHandler uniqueInstance;
				addEventHandler: BrTextWordPieceBlurHandler uniqueInstance;
				
				"selection changed in the editor, select a given interval"
				addEventHandler: BrTextWordPieceSelectionHandler uniqueInstance;
				
				"selection changed in the editor, deselect a given interval"
				addEventHandler: BrTextWordPieceDeselectionHandler uniqueInstance;
				
				"text changed in the editor"
				addEventHandler: BrTextWordPieceTextChangeHandler uniqueInstance;		
				
				"when clicking inside of a text piece we should move cursor there and request editor focus"
				addEventHandler: BrTextEditorMouseDownHandler uniqueInstance;
				
				"when double-clicking inside of a text piece we should select the whole word"
				addEventHandler: BrTextWordPieceDoubleClickHandler uniqueInstance;

				"text piece got inside of selected area"
				addEventHandler: BrTextWordPieceSelectionAcquiredHandler uniqueInstance;

				"text piece got outside of then selected area"
				addEventHandler: BrTextWordPieceSelectionLostHandler uniqueInstance;

				yourself ]
]

{ #category : #'api - instantiation' }
BrTextWordPieceStencilBuilder >> buildDefault [
	| aTextElement |
	
	aTextElement := self acquire
		segmentPiece: self segmentPiece;
		padding: self wordPadding;
		margin: self wordMargin.
		
	self reset.
	
	^ aTextElement
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

{ #category : #'api - instantiation' }
BrTextWordPieceStencilBuilder >> recycle: aPieceElement [
	aPieceElement removeFromParent.
	aPieceElement removeCursors.

	"otherwise attributes may not be garbage collected
	see https://github.com/feenkcom/gtoolkit/issues/537"
	aPieceElement removeSegmentPiece.

	TextPiecePool release: aPieceElement
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
BrTextWordPieceStencilBuilder >> text: aText start: aTextStart end: aTextEnd [
	self deprecated: 'Use segmentPiece: instead'.
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
