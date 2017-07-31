dnd handlers
dragOverEvent: anEvent
	| aScrollingArea anOverDrag anOverDragLimit |
	
	"For selection we want to handle only those drag events that began exactly
	on the elemen I attached to"
	self hasOrigin
		ifFalse: [ ^ super dragOverEvent: anEvent ].

	corner := anEvent position.

	aScrollingArea := self scrollingElement boundsInSpace.

	anOverDragLimit := 75.
	anOverDrag := (aScrollingArea bottom - corner y) abs.

	anOverDrag < anOverDragLimit
		ifTrue: [ scrollingDelta := 0@ ((BlEasingQuad new interpolate: (1.0 - (anOverDrag / anOverDragLimit) asFloat)) * 10 ) ]
		ifFalse: [ scrollingDelta := 0@0 ].

	self updateSelection: self scrollingElement