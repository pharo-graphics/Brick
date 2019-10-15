Class {
	#name : #BrAnchoredGeometry,
	#superclass : #BlRectangle,
	#instVars : [
		'element'
	],
	#category : #'Brick-Anchored - Support'
}

{ #category : #'as yet unclassified' }
BrAnchoredGeometry class >> cornerRadius: aNumber element: anElement [
	^ (self cornerRadius: aNumber)
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
	bounds := element children collect: [ :e | e bounds asRectangle ].
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
		moveTo: points first + (cornerRadii max @ cornerRadii max * directions second).
	"last points is same as first, remove it"
	points removeFirst.
	directions removeFirst.
	points
		withIndexDo: [ :e :i | 
			| directionIncoming directionOutgoing next |
			directionIncoming := directions at: i.
			directionOutgoing := directions at: i \\ points size + 1.
			path
				lineTo: e - (cornerRadii max @ cornerRadii max * directionIncoming).
			next := e + (cornerRadii max @ cornerRadii max * directionOutgoing).
			(directionIncoming crossProduct: directionOutgoing) < 0
				ifTrue: [ path ccwArcTo: next ]
				ifFalse: [ path cwArcTo: next ] ].
	^ path close build
]

{ #category : #'geometry testing' }
BrAnchoredGeometry >> containsPoint: aPoint in: aBlElement [
	^ aBlElement children
		anySatisfy: [ :e | e containsPoint: aPoint - e position ]
]

{ #category : #accessing }
BrAnchoredGeometry >> element [
	^ element
]

{ #category : #accessing }
BrAnchoredGeometry >> element: anObject [
	element := anObject
]
