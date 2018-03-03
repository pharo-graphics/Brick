selection
top: aBoundsInLocal in: aSelectionBounds ifNone: aNoneBlock
	"Assuming that user selects in *TOP direction* return intersection of selection bounds
	and provided local element bounds.
	Note: Both are given in the same coordinate system!"
	<return: #BlBounds>

	"to the right from the corner"
	(aBoundsInLocal top <= aSelectionBounds bottom and: [ aBoundsInLocal bottom <= aSelectionBounds top ])
		ifTrue: [	
			^ aBoundsInLocal
				intersect: (BlBounds origin: aSelectionBounds corner corner: aBoundsInLocal corner) encompass
				ifNone: aNoneBlock ].

	"to the left from the origin"
	(aBoundsInLocal top >= aSelectionBounds bottom and: [ aBoundsInLocal bottom >= aSelectionBounds top ])
		ifTrue: [
			^ aBoundsInLocal
				intersect: (BlBounds origin: 0@0 corner: aSelectionBounds origin) encompass
				ifNone: aNoneBlock ].	

	"on the same line"
	^ aBoundsInLocal
		intersect: aSelectionBounds copy encompass
		ifNone: aNoneBlock