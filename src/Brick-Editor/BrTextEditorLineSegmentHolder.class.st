"
I am a line segment holder and is responsible for binding ===BrTextEditorLineSegment=== with corresponding visual element
"
Class {
	#name : #BrTextEditorLineSegmentHolder,
	#superclass : #BrTextEditorSegmentHolder,
	#instVars : [
		'segment',
		'pieceElements'
	],
	#classInstVars : [
		'defaultSegmentLayoutBlock'
	],
	#category : #'Brick-Editor-Model - Segment-Text-Line'
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

{ #category : #'private - accessing' }
BrTextEditorLineSegmentHolder >> cachedPieces [
	<return: #Collection of: #BrTextEditorLineSegmentPiece>
	
	^ pieceElements collect: #key
]

{ #category : #initialization }
BrTextEditorLineSegmentHolder >> createSegmentElement [
	<return: #BlElement>

	^ BrTextEditorSegmentElement new
		beInSeparateCompositionLayer;
		layout: self class defaultSegmentLayout;
		focusability: BlFocusability after;
		addEventHandler: BrTextEditorMouseDownHandler uniqueInstance;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ];
		look: (BrLayoutResizerLook new
			hExactToMatchParent;
			hMatchParent;
			hFitContent;
			vAnyToFitContent);
		yourself
]

{ #category : #cursor }
BrTextEditorLineSegmentHolder >> explicitScreenToCursor: aTransformation [
	| aBoundsInEditor aPositionInSegment aClosestPieceElement aClosestPiece aTransformedScreenPosition |
	
	aTransformedScreenPosition := aTransformation screenPosition.
	aBoundsInEditor := (itemElement bounds inParent: self infiniteElement) bounds.
	
	"if location is above the first segment then the index is 0"
	((segment isFirstIn: self editor) and: [ aTransformedScreenPosition y < aBoundsInEditor top ])
		ifTrue: [ ^ aTransformation transformed: 0 ].

	"if location is below the last segment then the index is text size"
	((segment isLastIn: self editor) and: [ aTransformedScreenPosition y > aBoundsInEditor bottom ])
		ifTrue: [ ^ aTransformation transformed: self editor text size ].	

	"not in this segment, ignoring"
	(aTransformedScreenPosition y between: aBoundsInEditor top and: aBoundsInEditor bottom)
		ifFalse: [  ^ self ].
			
	aPositionInSegment := (itemElement globalBoundsToMine: (BlBounds origin: aTransformation screenPosition extent: 0.0@0.0) fromParent: self infiniteElement) center.	
	segment hasPieces
		ifFalse: [ ^ self ].
	
	"trying to find a segment that actually contains a given position"
	self piecesAndTheirElementsDo: [ :aPiece :aPieceElement |
		(aPieceElement bounds inParent bounds containsPoint: aPositionInSegment)
			ifTrue: [ ^ aPiece screenToCursor: aTransformation of: self infiniteElement in: aPieceElement ] ].
		
	"clicked outside of a segment piece, should find the closest element"
	
	aClosestPieceElement := itemElement layout findClosestChildOf: itemElement to: aPositionInSegment.
	aClosestPiece := self 
		pieceForElement: aClosestPieceElement
		ifAbsent: [ ^ self ].
		
	aClosestPiece screenToCursor: aTransformation of: self infiniteElement in: aClosestPieceElement
]

{ #category : #updating }
BrTextEditorLineSegmentHolder >> onCursorChanged [
	"Is sent when text editor's cursor changes.
	Segment holder should update text elements accordingly"

	self
		assert: [ segment isNotNil ]
		description: [ 'Segment must be bound!' ].

	self piecesAndTheirElementsDo: [ :aPiece :aPieceElement |
		aPiece updateCursor: aPieceElement of: segment in: self infiniteElement ]
]

{ #category : #updating }
BrTextEditorLineSegmentHolder >> onFocusChanged: aBoolean [
	"Is sent when text editor's focus state changes.
	Segment holder should update text elements accordingly"

	self
		assert: [ segment isNotNil ]
		description: [ 'Segment must be bound!' ].

	self piecesAndTheirElementsDo: [ :aPiece :aPieceElement |
		aPiece updateFocus: aBoolean of: aPieceElement in: self infiniteElement ]
]

{ #category : #updating }
BrTextEditorLineSegmentHolder >> onRecycled [

	itemElement removeChildren.
	self piecesAndTheirElementsDo: [ :aPiece :aPieceElement | aPiece onRecycled: aPieceElement in: self infiniteElement ].
	pieceElements := nil.
	segment := nil.
]

{ #category : #updating }
BrTextEditorLineSegmentHolder >> onSelectionChanged [
	"Is sent when text editor's selection changes.
	Segment holder should update text elements accordingly"
		
	self
		assert: [ segment isNotNil ]
		description: [ 'Segment must be bound!' ].

	self piecesAndTheirElementsDo: [ :aPiece :aPieceElement |
		aPiece updateSelection: aPieceElement of: segment in: self infiniteElement ]
]

{ #category : #updating }
BrTextEditorLineSegmentHolder >> onTextChanged [
	"Is sent when text changed in the editor (for example style attributes).
	Segment holder should update text elements accordingly"
		
	self
		assert: [ segment isNotNil ]
		description: [ 'Segment must be bound!' ].

	self piecesAndTheirElementsDo: [ :aPiece :aPieceElement |
		aPiece updateText: aPieceElement of: segment in: self infiniteElement ]
]

{ #category : #enumerating }
BrTextEditorLineSegmentHolder >> pieceForElement: aBlElement ifAbsent: anAbsentBlock [
	<return: #BrTextEditorLineSegmentPiece>
	
	pieceElements do: [ :eachAssociation |
		(eachAssociation value includes: aBlElement) 
			ifTrue: [ ^ eachAssociation key ] ].
	^ anAbsentBlock value
]

{ #category : #enumerating }
BrTextEditorLineSegmentHolder >> piecesAndTheirElementsDo: aBlock [
	pieceElements do: [ :eachAssociation |
		| aPiece thePieceElements |
		aPiece := eachAssociation key.
		thePieceElements := eachAssociation value.
		thePieceElements do: [ :aPieceElement | aBlock value: aPiece value: aPieceElement ] ]
]

{ #category : #cursor }
BrTextEditorLineSegmentHolder >> relativeScreenToCursor: aTransformation [	
	"trying to find a segment that actually contains a given position"

	self piecesAndTheirElementsDo: [ :aPiece :aPieceElement |
		(aTransformation cursor insideSubText: aPiece of: segment)
			ifTrue: [ ^ aPiece screenToCursor: aTransformation of: self infiniteElement in: aPieceElement ] ]
]

{ #category : #cursor }
BrTextEditorLineSegmentHolder >> screenToCursor: aTransformation [
	aTransformation evaluateOn: self
]

{ #category : #accessing }
BrTextEditorLineSegmentHolder >> segment: anEditorSegment [
	| newPieceElements |
	
	segment == anEditorSegment
		ifTrue: [ ^ self updateSegment: anEditorSegment ].

	segment := anEditorSegment.
	segment updateSegmentProperties.

	pieceElements := OrderedCollection new.
	newPieceElements := OrderedCollection new.
	segment pieces do: [ :aPiece | 
		| thePieceElements |
		thePieceElements := (aPiece createElement: self infiniteElement) asOrderedCollection.
		newPieceElements addAll: thePieceElements.
		pieceElements add: (aPiece -> thePieceElements) ].
	
	self piecesAndTheirElementsDo: [ :aPiece :aPieceElement |
		aPiece setCursor: aPieceElement of: anEditorSegment in: self infiniteElement.
		aPiece updateSelection: aPieceElement of: anEditorSegment in: self infiniteElement.
		aPiece updateFocus: self infiniteElement hasFocus of: aPieceElement in: self infiniteElement ].

	itemElement
		removeChildren;
		addChildren: newPieceElements;
		constraintsDo: [ :c | c horizontal resizer: infiniteElement constraints horizontal resizer ];
		padding: anEditorSegment paragraphMargin
]

{ #category : #accessing }
BrTextEditorLineSegmentHolder >> updateSegment: anEditorSegment [
	| newPieceMap newPieceElements |
	self
		assert: [ segment == anEditorSegment ]
		description: [ 'Can only update the same segment!' ].

	segment := anEditorSegment.
	segment updateSegmentProperties.
	
	newPieceMap := OrderedCollection new.
	newPieceElements := OrderedCollection new.
	
	segment pieces do: [ :eachSegmentPiece | 
		| thePieceElements |
	
		thePieceElements := pieceElements
			detect: [ :eachAssociation | eachAssociation key = eachSegmentPiece ]
			ifFound: [ :eachAssociation |
				| eachPiece theSegmentElements |
				theSegmentElements := eachAssociation value.
				eachPiece := eachAssociation key.
				
				"We should transfer the knowledge of the cursors to the new segment piece,
				otherwise cursors may not be removed from the corresponding elements
				https://github.com/feenkcom/gtoolkit/issues/892"
				eachSegmentPiece currentCursors: eachPiece currentCursors.
				
				theSegmentElements do: [ :eachSegmentElement |
					eachPiece updateText: eachSegmentElement of: segment in: self infiniteElement ].
				theSegmentElements ]
			ifNone: [ (eachSegmentPiece createElement: self infiniteElement) asOrderedCollection ].
	
		newPieceElements addAll: thePieceElements.
		newPieceMap add: (eachSegmentPiece -> thePieceElements) ].

	pieceElements := newPieceMap.

	self piecesAndTheirElementsDo: [ :aPiece :aPieceElement |
		aPiece updateCursor: aPieceElement of: anEditorSegment in: self infiniteElement.
		aPiece updateSelection: aPieceElement of: anEditorSegment in: self infiniteElement ].

	itemElement
		removeChildren;
		addChildren: newPieceElements;
		constraintsDo: [ :c | c horizontal resizer: infiniteElement constraints horizontal resizer ];
		padding: anEditorSegment paragraphMargin
]
