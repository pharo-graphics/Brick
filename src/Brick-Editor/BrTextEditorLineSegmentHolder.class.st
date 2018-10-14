"
I am a line segment holder and is responsible for binding ===BrTextEditorLineSegment=== with corresponding visual element
"
Class {
	#name : #BrTextEditorLineSegmentHolder,
	#superclass : #BrTextEditorSegmentHolder,
	#instVars : [
		'segment',
		'pieces',
		'pieceElements'
	],
	#classInstVars : [
		'defaultSegmentLayoutBlock'
	],
	#category : 'Brick-Editor-Model - Segment-Text-Line'
}

{ #category : #cleanup }
BrTextEditorLineSegmentHolder class >> cleanUp [
	super cleanUp.
	
	defaultSegmentLayoutBlock := nil
]

{ #category : #accessing }
BrTextEditorLineSegmentHolder class >> defaultSegmentLayout [
	^ (defaultSegmentLayoutBlock ifNil: [ BrEditorTextFlowLayout new ]) value
]

{ #category : #accessing }
BrTextEditorLineSegmentHolder class >> defaultSegmentLayout: aBlock [
	defaultSegmentLayoutBlock := aBlock
]

{ #category : #initialization }
BrTextEditorLineSegmentHolder >> createSegmentElement [
	<return: #BlElement>

	^ BrTextEditorSegmentElement new
		layout: self class defaultSegmentLayout;
		focusability: BlFocusability after;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ];
		yourself
]

{ #category : #updating }
BrTextEditorLineSegmentHolder >> onCursorChanged [
	"Is sent when text editor's cursor changes.
	Segment holder should update text elements accordingly"

	self
		assert: [ segment isNotNil ]
		description: [ 'Segment must be bound!' ].

	pieces
		with: pieceElements
		do: [ :aPiece :aPieceElement | aPiece updateCursor: aPieceElement of: segment in: self infiniteElement ]
]

{ #category : #updating }
BrTextEditorLineSegmentHolder >> onSelectionChanged [
	"Is sent when text editor's selection changes.
	Segment holder should update text elements accordingly"
		
	self
		assert: [ segment isNotNil ]
		description: [ 'Segment must be bound!' ].

	pieces
		with: pieceElements
		do: [ :aPiece :aPieceElement | aPiece updateSelection: aPieceElement of: segment in: self infiniteElement ]
]

{ #category : #accessing }
BrTextEditorLineSegmentHolder >> segment: anEditorSegment [
	segment := anEditorSegment.

	pieces := segment pieces.
	pieceElements := pieces collect: [ :aPiece | aPiece createElement: self infiniteElement ].
	
	pieces
		with: pieceElements
		do: [ :aPiece :aPieceElement |
			aPiece updateCursor: aPieceElement of: anEditorSegment in: self infiniteElement.
			aPiece updateSelection: aPieceElement of: anEditorSegment in: self infiniteElement ].

	itemElement
		removeChildren;
		addChildren: pieceElements;
		constraintsDo: [ :c | c horizontal resizer: infiniteElement constraints horizontal resizer ];
		layoutDo: [ :aLayout | aLayout lineSpacing: anEditorSegment lineSpacing ];
		margin: anEditorSegment paragraphMargin
]
