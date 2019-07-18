Class {
	#name : #BrTextWordPieceStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'text',
		'wordPadding',
		'measurer'
	],
	#category : #'Brick-Editor-UI - Stencils'
}

{ #category : #'api - instantiation' }
BrTextWordPieceStencilBuilder >> buildDefault [
	^ BrTextElementWithCursors new
		text: self text;
		clipChildren: false;
		padding: self wordPadding;
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

		yourself
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
