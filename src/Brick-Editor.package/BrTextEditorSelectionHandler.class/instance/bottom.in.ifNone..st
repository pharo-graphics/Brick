selection
bottom: aBoundsInLocal in: aSelectionBounds ifNone: aNoneBlock
	"Assuming that user selects in *BOTTOM direction* return intersection of selection bounds
	and provided local element bounds.
	Note: Both are given in the same coordinate system!"
	<return: #BlBounds>
	
	"to the right from the origin"
	(aBoundsInLocal top <= aSelectionBounds top and: [ aBoundsInLocal bottom <= aSelectionBounds bottom ])
		ifTrue: [
			^ aBoundsInLocal
				intersect: (BlBounds origin: aSelectionBounds origin corner: aBoundsInLocal corner) encompass
				ifNone: aNoneBlock ].
			
	"to the left from the corner"
	(aBoundsInLocal top >= aSelectionBounds top and: [ aBoundsInLocal bottom >= aSelectionBounds bottom ])
		ifTrue: [	
			^ aBoundsInLocal
				intersect: (BlBounds origin: 0@0 corner: aSelectionBounds corner) encompass
				ifNone: aNoneBlock ].

	"on the same line"
	^ aBoundsInLocal
		intersect: aSelectionBounds copy encompass
		ifNone: aNoneBlock