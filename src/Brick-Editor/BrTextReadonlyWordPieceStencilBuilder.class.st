Class {
	#name : #BrTextReadonlyWordPieceStencilBuilder,
	#superclass : #BrTextWordPieceStencilBuilder,
	#classVars : [
		'TextPiecePool'
	],
	#category : #'Brick-Editor-UI - Stencils'
}

{ #category : #cleanup }
BrTextReadonlyWordPieceStencilBuilder class >> cleanUp [
	self initialize
]

{ #category : #cleanup }
BrTextReadonlyWordPieceStencilBuilder class >> initialize [
	TextPiecePool := BlSynchronizedObjectPool pool: (BlBagObjectPool new: 1000)
]

{ #category : #'api - instantiation' }
BrTextReadonlyWordPieceStencilBuilder >> createWordElement [
	<return: #BrTextElementWithCursors>

	^ BrTextElementWithCursors new
			editorMeasurement;

			"to support event-handling attributes"
			addEventHandler: BrTextEditorLineSegmentTextListener uniqueInstance;
			
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

			"text piece got inside of selected area"
			addEventHandler: BrTextWordPieceSelectionAcquiredHandler uniqueInstance;

			"text piece got outside of then selected area"
			addEventHandler: BrTextWordPieceSelectionLostHandler uniqueInstance;

			yourself
]

{ #category : #'private - pool' }
BrTextReadonlyWordPieceStencilBuilder >> pool [
	^ TextPiecePool
]
