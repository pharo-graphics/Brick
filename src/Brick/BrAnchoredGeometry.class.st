Class {
	#name : #BrAnchoredGeometry,
	#superclass : #BlGeometry,
	#instVars : [
		'element',
		'cornerRadius'
	],
	#category : #'Brick-Anchored - Support'
}

{ #category : #'as yet unclassified' }
BrAnchoredGeometry class >> cornerRadius: aNumber element: anElement [
	^ self new
		cornerRadius: aNumber;
		element: anElement;
		yourself
]

{ #category : #'as yet unclassified' }
BrAnchoredGeometry class >> element: anElement [
	^ self new
		element: anElement;
		yourself
]

{ #category : #'as yet unclassified' }
BrAnchoredGeometry >> buildPathOnSpartaCanvas: aCanvas [
	"Computes boundaries according to https://stackoverflow.com/questions/289779/calculating-a-boundary-around-several-linked-rectangles.
	Assumes bounds are overlapping or touching, gaps will lead to only parts included in geometry."

	| bounds vertices xs ys areas corners points directions initialCursor cursor direction path |
	"1. compute areas covered by children bounds"
	bounds := element children
		collect: [ :e | e bounds inParent asRectangle ].
	vertices := bounds
		flatCollect: [ :e | 
			{e origin.
			e corner} ].
	xs := (vertices collect: #x) asSet asOrderedCollection sorted.
	ys := (vertices collect: #y) asSet asOrderedCollection sorted.
	areas := (Array2D
		rows: ys size - 1
		columns: xs size - 1
		element: false)
		withIndicesCollect: [ :e :i :j | 
			bounds
				anySatisfy: [ :f | 
					f
						containsRect:
							(Rectangle
								origin: (xs at: j) @ (ys at: i)
								corner: (xs at: j + 1) @ (ys at: i + 1)) ] ].
	"2. detect corners around covered area"
	corners := (Array2D rows: ys size columns: xs size element: false)
		withIndicesCollect: [ :e :i :j | 
			| topLeft topRight bottomLeft bottomRight neighbours |
			topLeft := areas at: i - 1 at: j - 1 ifInvalid: false.
			topRight := areas at: i - 1 at: j ifInvalid: false.
			bottomLeft := areas at: i at: j - 1 ifInvalid: false.
			bottomRight := areas at: i at: j ifInvalid: false.
			neighbours := ({topLeft.
			topRight.
			bottomLeft.
			bottomRight} select: #yourself) size.
			neighbours odd
				ifTrue: [ true ]
				ifFalse: [ (neighbours = 0 or: [ neighbours = 4 ])
						ifTrue: [ false ]
						ifFalse: [ topLeft = bottomRight ] ] ].
	"3. collect corner points and direction on which they were detected"
	points := OrderedCollection new.
	directions := OrderedCollection new.
	initialCursor := ((corners atRow: 1)
		detectIndex: #yourself
		ifNone: [ ^ aCanvas path build ]) @ 1.
	cursor := initialCursor.
	direction := 0 @ 1.
	points add: (xs at: cursor x) @ (ys at: cursor y).
	directions add: 0 @ -1.
	[ | backtrackingCursor |
	backtrackingCursor := cursor.
	direction := direction y negated @ direction x.
	[ cursor := cursor + direction ]
		doWhileFalse: [ (cursor <= corners extent and: [ cursor >= (1 @ 1) ])
				ifTrue: [ corners at: cursor y at: cursor x ]
				ifFalse: [ "backtrack to original cursor, rotate direction"
					cursor := backtrackingCursor.
					direction := direction y negated @ direction x.
					false ] ].
	points add: (xs at: cursor x) @ (ys at: cursor y).
	directions add: direction.
	direction := direction negated ]
		doWhileFalse: [ cursor = initialCursor ].
	"4. compute path with rounded corners"
	path := aCanvas path.
	path
		moveTo: points first + (cornerRadius @ cornerRadius * directions second).
	"last points is same as first, remove it"
	points removeFirst.
	directions removeFirst.
	points
		withIndexDo: [ :e :i | 
			| directionIncoming directionOutgoing previous next before after |
			directionIncoming := directions at: i.
			directionOutgoing := directions at: i \\ points size + 1.
			previous := points at: (i - 2 + points size) \\ points size + 1.
			next := points at: i \\ points size + 1.
			before := e
				-
					((cornerRadius min: (e - previous) r / 2) asPoint * directionIncoming).
			after := e
				+ ((cornerRadius min: (e - next) r / 2) asPoint * directionOutgoing).
			path lineTo: before.
			(directionIncoming crossProduct: directionOutgoing) < 0
				ifTrue: [ path ccwArcTo: after ]
				ifFalse: [ path cwArcTo: after ] ].
	^ path close build
]

{ #category : #'geometry testing' }
BrAnchoredGeometry >> containsPoint: aPoint in: aBlElement [
	^ aBlElement children
		anySatisfy: [ :e | e containsPoint: aPoint - e position ]
]

{ #category : #accessing }
BrAnchoredGeometry >> cornerRadius [
	^ cornerRadius
]

{ #category : #accessing }
BrAnchoredGeometry >> cornerRadius: anObject [
	cornerRadius := anObject
]

{ #category : #accessing }
BrAnchoredGeometry >> element [
	^ element
]

{ #category : #accessing }
BrAnchoredGeometry >> element: anObject [
	element := anObject
]

{ #category : #initialization }
BrAnchoredGeometry >> initialize [
	super initialize.
	cornerRadius := 0
]

{ #category : #geometry }
BrAnchoredGeometry >> matchExtent: aPoint [
	extent := aPoint
]

{ #category : #geometry }
BrAnchoredGeometry >> pathOnSpartaCanvas: aCanvas [
	^ self buildPathOnSpartaCanvas: aCanvas
]

{ #category : #'visual bounds' }
BrAnchoredGeometry >> strokedBounds: aBlBounds of: anElement on: aCanvas [
	^ anElement outskirts
		strokedBounds: aBlBounds
		of: anElement
		on: aCanvas
]

{ #category : #'visual bounds' }
BrAnchoredGeometry >> strokedBoundsCentered: aBlBounds of: aBlElement on: aCanvas [
	^ (self geometryBounds: aBlBounds)
		expandBy: aBlElement border width / 2.0
]

{ #category : #'visual bounds' }
BrAnchoredGeometry >> strokedBoundsOutside: aBlBounds of: aBlElement on: aCanvas [
	^ (self geometryBounds: aBlBounds) expandBy: aBlElement border width
]
