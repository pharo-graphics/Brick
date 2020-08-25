Class {
	#name : #BrTextEditorParagraphSegmentHolder,
	#superclass : #BrTextEditorSegmentHolder,
	#instVars : [
		'segment',
		'pieceElements'
	],
	#classInstVars : [
		'defaultSegmentLayoutBlock'
	],
	#category : #'Brick-Editor-Model - Segment-Text-Paragraph'
}

{ #category : #cleanup }
BrTextEditorParagraphSegmentHolder class >> cleanUp [
	super cleanUp.
	
	defaultSegmentLayoutBlock := nil
]

{ #category : #accessing }
BrTextEditorParagraphSegmentHolder class >> defaultSegmentLayout [
	^ (defaultSegmentLayoutBlock ifNil: [ BrEditorTextFlowLayout new ]) value
]

{ #category : #accessing }
BrTextEditorParagraphSegmentHolder class >> defaultSegmentLayout: aBlock [
	defaultSegmentLayoutBlock := aBlock
]

{ #category : #'private - segment' }
BrTextEditorParagraphSegmentHolder >> buildSegment: anEditorSegment [
	| newPieceElements thePieces hasSelection hasCursor |

	segment := anEditorSegment.

	hasSelection := self hasSelection.
	hasCursor := self hasCursor.
	
	self infiniteElement telemetry
		timeSync: [ 'Update segment properties' ]
		during: [ segment updateSegmentProperties ].

	pieceElements := self newPiecesMap.
	newPieceElements := OrderedCollection new.

	thePieces := self infiniteElement telemetry
		timeSync: [ 'Get pieces' ]
		during: [ segment pieces ].
	
	self infiniteElement telemetry
		timeSync: [ 'Create piece elements' ]
		during: [
			thePieces withIndexDo: [ :aPiece :eachIndex | 
				| thePieceElements |
				
				thePieceElements := self infiniteElement telemetry
					timeSync: [ 'Create piece elements at {1}' format: { eachIndex } ]
					during: [ (aPiece createElement: self infiniteElement) asOrderedCollection ].
				
				newPieceElements addAll: thePieceElements.
				pieceElements atPiece: aPiece putElements: thePieceElements ] ].

	(hasCursor or: [ hasSelection ])
		ifTrue: [
			self infiniteElement telemetry
				timeSync: [ 'Set cursor, selection' ]
				during: [
					pieceElements piecesAndTheirElementsDo: [ :aPiece :aPieceElement |
						hasCursor
							ifTrue: [
								self infiniteElement telemetry
									timeSync: [ 'Set cursor' ]
									during: [ aPiece setCursor: aPieceElement of: anEditorSegment in: self infiniteElement ] ].
						
						hasSelection
							ifTrue: [
								self infiniteElement telemetry
									timeSync: [ 'Set selection' ]
									during: [ aPiece updateSelection: aPieceElement of: anEditorSegment in: self infiniteElement ] ] ] ] ].

	self infiniteElement telemetry
		timeSync: [ 'Remove segment children' ]
		during: [ itemElement removeChildren ].

	self infiniteElement telemetry
		timeSync: [ 'Add segment children' ]
		during: [ itemElement addChildren: newPieceElements ].

	itemElement
		constraintsDo: [ :c | c horizontal resizer: infiniteElement constraints horizontal resizer ];
		padding: anEditorSegment paragraphMargin
]

{ #category : #'private - accessing' }
BrTextEditorParagraphSegmentHolder >> cachedPieces [
	<return: #Collection of: #BrTextEditorLineSegmentPiece>
	
	^ pieceElements allPieces
]

{ #category : #initialization }
BrTextEditorParagraphSegmentHolder >> createSegmentElement [
	<return: #BlElement>

	^ BrTextEditorParagraphElement new
		beInSeparateCompositionLayer;
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
BrTextEditorParagraphSegmentHolder >> explicitScreenToCursor: aTransformation [
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
	pieceElements piecesAndTheirElementsDo: [ :aPiece :aPieceElement |
		(aPieceElement bounds inParent bounds containsPoint: aPositionInSegment)
			ifTrue: [ ^ aPiece screenToCursor: aTransformation of: self infiniteElement in: aPieceElement ] ].
		
	"clicked outside of a segment piece, should find the closest element"
	
	aClosestPieceElement := itemElement layout findClosestChildOf: itemElement to: aPositionInSegment.
	aClosestPiece := pieceElements 
		pieceForElement: aClosestPieceElement
		ifAbsent: [ ^ self ].
		
	aClosestPiece screenToCursor: aTransformation of: self infiniteElement in: aClosestPieceElement
]

{ #category : #'private - testing' }
BrTextEditorParagraphSegmentHolder >> hasCursor [
	| aTextEditor |

	aTextEditor := self infiniteElement editor.
	aTextEditor cursor do: [ :aCursor |
		(aCursor insideSegment: segment)
			ifTrue: [ ^ true ] ].

	^ false
]

{ #category : #'private - testing' }
BrTextEditorParagraphSegmentHolder >> hasSelection [
	| aTextEditor textInterval |

	aTextEditor := self infiniteElement editor.
	textInterval := BlSelection from: (segment textStart + 1 min: segment textEnd) to: segment textEnd.
	
	(aTextEditor selection + aTextEditor selectionRecorder selection) do: [ :aSelection |
		(aSelection overlaps: textInterval)
			ifTrue: [ ^ true ] ].

	^ false
]

{ #category : #'private - segment' }
BrTextEditorParagraphSegmentHolder >> newPiecesMap [
	^ BrTextEditorLineSegmentPieceCollectionMap new
]

{ #category : #updating }
BrTextEditorParagraphSegmentHolder >> onCursorChanged [
	"Is sent when text editor's cursor changes.
	Segment holder should update text elements accordingly"

	self
		assert: [ segment isNotNil ]
		description: [ 'Segment must be bound!' ].

	pieceElements piecesAndTheirElementsDo: [ :aPiece :aPieceElement |
		aPiece updateCursor: aPieceElement of: segment in: self infiniteElement ]
]

{ #category : #updating }
BrTextEditorParagraphSegmentHolder >> onFocusChanged: aBoolean [
	"Is sent when text editor's focus state changes.
	Segment holder should update text elements accordingly"

	self
		assert: [ segment isNotNil ]
		description: [ 'Segment must be bound!' ].

	pieceElements piecesAndTheirElementsDo: [ :aPiece :aPieceElement |
		aPiece updateFocus: aBoolean of: aPieceElement in: self infiniteElement ]
]

{ #category : #updating }
BrTextEditorParagraphSegmentHolder >> onRecycled [

	itemElement removeChildren.
	pieceElements piecesAndTheirElementsDo: [ :aPiece :aPieceElement | aPiece onRecycled: aPieceElement in: self infiniteElement ].
	pieceElements := nil.
	segment := nil.
]

{ #category : #updating }
BrTextEditorParagraphSegmentHolder >> onSelectionChanged [
	"Is sent when text editor's selection changes.
	Segment holder should update text elements accordingly"
		
	self
		assert: [ segment isNotNil ]
		description: [ 'Segment must be bound!' ].

	pieceElements piecesAndTheirElementsDo: [ :aPiece :aPieceElement |
		aPiece updateSelection: aPieceElement of: segment in: self infiniteElement ]
]

{ #category : #updating }
BrTextEditorParagraphSegmentHolder >> onTextChanged [
	"Is sent when text changed in the editor (for example style attributes).
	Segment holder should update text elements accordingly"

	self
		assert: [ segment isNotNil ]
		description: [ 'Segment must be bound!' ].

	pieceElements piecesAndTheirElementsDo: [ :aPiece :aPieceElement |
		aPiece updateText: aPieceElement of: segment in: self infiniteElement ]
]

{ #category : #cursor }
BrTextEditorParagraphSegmentHolder >> relativeScreenToCursor: aTransformation [	
	"trying to find a segment that actually contains a given position"

	pieceElements piecesAndTheirElementsDo: [ :aPiece :aPieceElement |
		(aTransformation cursor insideSubText: aPiece of: segment)
			ifTrue: [ ^ aPiece screenToCursor: aTransformation of: self infiniteElement in: aPieceElement ] ]
]

{ #category : #cursor }
BrTextEditorParagraphSegmentHolder >> screenToCursor: aTransformation [
	aTransformation evaluateOn: self
]

{ #category : #accessing }
BrTextEditorParagraphSegmentHolder >> segment: anEditorSegment [
	self infiniteElement telemetry
		timeSync: [ 'Build segment at {1}' format: { anEditorSegment index } ]
		during: [ self buildSegment: anEditorSegment ]
]
