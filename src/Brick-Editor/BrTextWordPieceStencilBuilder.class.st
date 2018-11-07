Class {
	#name : #BrTextWordPieceStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'text',
		'segmentPiece',
		'editorElement',
		'measurer',
		'mouseDownHandler',
		'selectionAcquiredHandler',
		'selectionLostHandler'
	],
	#category : #'Brick-Editor-UI - Stencils'
}

{ #category : #'api - instantiation' }
BrTextWordPieceStencilBuilder >> buildDefault [
	^ BlTextEditElement new
		text: self text;
		clipChildren: false;
		padding: (self segmentPiece segment wordPadding);
		
		"to support event-handling attributes"
		addEventHandler: (BrTextEditorAttributedLineSegmentTextListener new editorElement: self editorElement);

		"editor requests to show a cursor as a result of its position change"
		addEventHandler: BrTextWordPieceShowCursorHandler uniqueInstance;
		
		"editor requests to remove a cursor as a result of its position change"
		addEventHandler: BrTextWordPieceHideCursorHandler uniqueInstance;

		addEventHandler: BrTextWordPieceFocusHandler uniqueInstance;
		addEventHandler: BrTextWordPieceBlurHandler uniqueInstance;
		
		"selection changed in the editor, select a given interval"
		addEventHandler: BrTextWordPieceSelectionHandler uniqueInstance;
		
		"selection changed in the editor, deselect a given interval"
		addEventHandler: BrTextWordPieceDeselectionHandler uniqueInstance;
		
		"text changed in the editor"
		addEventHandler: BrTextWordPieceTextChangeHandler uniqueInstance;		
		
		"when clicking inside of a text piece we should move cursor there and request editor focus"
		addEventHandler: mouseDownHandler;

		"text piece got inside of selected area"
		addEventHandler: selectionAcquiredHandler;

		"text piece got outside of then selected area"
		addEventHandler: selectionLostHandler;
		yourself
]

{ #category : #accessing }
BrTextWordPieceStencilBuilder >> editorElement [
	^ editorElement
]

{ #category : #accessing }
BrTextWordPieceStencilBuilder >> editorElement: anEditorElement [
	editorElement := anEditorElement.

	mouseDownHandler editorElement: anEditorElement.
	selectionAcquiredHandler editorElement: anEditorElement.
	selectionLostHandler editorElement: anEditorElement.
]

{ #category : #initialization }
BrTextWordPieceStencilBuilder >> initialize [
	super initialize.
	
	measurer := BlTextElementCanvasMeasurer new.
	mouseDownHandler := BrTextWordPieceMouseDownHandler new.
	selectionAcquiredHandler := BrTextWordPieceSelectionAcquiredHandler new.
	selectionLostHandler := BrTextWordPieceSelectionLostHandler new.
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
	aStencilExecutor
		push: self text;
		push: self editorElement;
		push: self segmentPiece
]

{ #category : #accessing }
BrTextWordPieceStencilBuilder >> segmentPiece [
	^ segmentPiece
]

{ #category : #accessing }
BrTextWordPieceStencilBuilder >> segmentPiece: anObject [
	segmentPiece := anObject
]

{ #category : #accessing }
BrTextWordPieceStencilBuilder >> text [
	^ text
]

{ #category : #accessing }
BrTextWordPieceStencilBuilder >> text: anObject [
	text := anObject
]
