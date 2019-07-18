Class {
	#name : #BrTextWordPieceStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'text',
		'wordPadding',
		'measurer'
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

	^ TextPiecePool acquire
		ifNil: [
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
	^ self acquire
		text: self text;
		padding: self wordPadding
]

{ #category : #initialization }
BrTextWordPieceStencilBuilder >> initialize [
	super initialize.
	
	wordPadding := BlInsets top: 0 bottom: 0.
	measurer := BlTextElementCanvasMeasurer new
]

{ #category : #accessing }
BrTextWordPieceStencilBuilder >> measurer [
	^ measurer
]

{ #category : #accessing }
BrTextWordPieceStencilBuilder >> measurer: aMeasurer [
	measurer := aMeasurer
]

{ #category : #'api - instantiation' }
BrTextWordPieceStencilBuilder >> paramsOn: aStencilExecutor [
	aStencilExecutor push: self text
]

{ #category : #'api - instantiation' }
BrTextWordPieceStencilBuilder >> recycle: aPieceElement [
	aPieceElement removeFromParent.
	aPieceElement removeCursors.

	TextPiecePool release: aPieceElement
]

{ #category : #accessing }
BrTextWordPieceStencilBuilder >> text [
	<return: #BlText>

	^ text
]

{ #category : #accessing }
BrTextWordPieceStencilBuilder >> text: aText [
	text := aText
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
