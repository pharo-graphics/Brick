Class {
	#name : #BrTextWordPieceStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'text',
		'editorElement',
		'wordPadding',
		'measurer',
		'mouseDownHandler',
		'doubleClickHandler',
		'selectionAcquiredHandler',
		'selectionLostHandler'
	],
	#category : #'Brick-Editor-UI - Stencils'
}

{ #category : #'api - instantiation' }
BrTextWordPieceStencilBuilder >> buildDefault [
	^ BrTextElementWithCursors new
		text: self text;
		clipChildren: false;
		padding: self wordPadding;
		ascentBaseline;
		looseMesurement;
		
		"to support event-handling attributes"
		addEventHandler: (BrTextEditorLineSegmentTextListener new editorElement: self editorElement);

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
		addEventHandler: mouseDownHandler;
		
		"when double-clicking inside of a text piece we should select the whole word"
		addEventHandler: doubleClickHandler;

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
	doubleClickHandler editorElement: anEditorElement.
	selectionAcquiredHandler editorElement: anEditorElement.
	selectionLostHandler editorElement: anEditorElement.
]

{ #category : #initialization }
BrTextWordPieceStencilBuilder >> initialize [
	super initialize.
	
	wordPadding := BlInsets top: 0 bottom: 0.
	measurer := BlTextElementCanvasMeasurer new.
	mouseDownHandler := BrTextEditorMouseDownHandler new.
	doubleClickHandler := BrTextWordPieceDoubleClickHandler new.
	selectionAcquiredHandler := BrTextWordPieceSelectionAcquiredHandler new.
	selectionLostHandler := BrTextWordPieceSelectionLostHandler new
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
		push: self editorElement
]

{ #category : #accessing }
BrTextWordPieceStencilBuilder >> text [
	^ text
]

{ #category : #accessing }
BrTextWordPieceStencilBuilder >> text: anObject [
	text := anObject
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
