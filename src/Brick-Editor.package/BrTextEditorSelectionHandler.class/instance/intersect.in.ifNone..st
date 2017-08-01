selection
intersect: aChildElement in: aSelectionBounds ifNone: aNoneBlock
	"Return selection intersection bounds of a given element and provided
	selection bounds in local child cordinates if intersection exists
	or evaluate a none block otherwise.
	Note: you should override me to modify selection area detection, for example
	for the case of text selection intersection is not just plain intersection"
	<return: #BlBounds>
	| boundsInLocal |

	boundsInLocal := aChildElement boundsInLocal.
	
	"element is above selection"
	boundsInLocal bottom < aSelectionBounds top
		ifTrue: [ ^ aNoneBlock value ].
		
	"element is below selection"
	boundsInLocal top > aSelectionBounds bottom
		ifTrue: [ ^ aNoneBlock value ].

	(boundsInLocal right < aSelectionBounds left and: [ boundsInLocal top < aSelectionBounds top ])
		ifTrue: [ ^ aNoneBlock value ].
	
	(boundsInLocal left > aSelectionBounds right and: [ boundsInLocal bottom  > aSelectionBounds bottom ])
		ifTrue: [ ^ aNoneBlock value ].

	(boundsInLocal bottom <= aSelectionBounds bottom)
		ifTrue: [ ^ boundsInLocal ].
	
	(boundsInLocal bottom >= aSelectionBounds bottom and: [ boundsInLocal right <= aSelectionBounds right ])
		ifTrue: [ ^ (0@0 corner: aSelectionBounds corner)
			intersect: boundsInLocal
			ifNone: boundsInLocal ].
	

	^ aSelectionBounds
		intersect: boundsInLocal
		ifNone: aNoneBlock