selection
intersect: aChildElement in: aSelectionBounds ifNone: aNoneBlock
	"Return selection intersection bounds of a given element and provided
	selection bounds in local child cordinates if intersection exists
	or evaluate a none block otherwise"
	<return: #BlBounds>
	| boundsInLocal aSelection |
	
	aSelection := aSelectionBounds copy encompass.
	boundsInLocal := BlBounds fromRectangle: aChildElement boundsInLocal.
	
	"element is above selection"
	boundsInLocal bottom < aSelection top
		ifTrue: [ ^ aNoneBlock value ].
		
	"element is below selection"
	boundsInLocal top > aSelection bottom
		ifTrue: [ ^ aNoneBlock value ].

	(boundsInLocal right < aSelection left and: [ boundsInLocal top < aSelection top ])
		ifTrue: [ ^ aNoneBlock value ].
	
	(boundsInLocal left > aSelection right and: [ boundsInLocal bottom  > aSelection bottom ])
		ifTrue: [ ^ aNoneBlock value ].

	"select evertyhing in the middle"
	(boundsInLocal top > aSelection top and: [ boundsInLocal bottom < aSelection bottom ])
		ifTrue: [ ^ boundsInLocal ].

	"corner cases:"
	(aSelectionBounds origin y < aSelectionBounds corner y)
		ifTrue: [ ^ self bottom: boundsInLocal in: aSelectionBounds ifNone: aNoneBlock ].
		
	(aSelectionBounds origin y > aSelectionBounds corner y)
		ifTrue: [ ^ self top: boundsInLocal in: aSelectionBounds ifNone: aNoneBlock ].
	
	^ aSelection
		intersect: boundsInLocal
		ifNone: aNoneBlock