as yet unclassified
thumbDragStart: aPoint
	| handThumbPos |
	handThumbPos := self orientation positionFromPoint: (thumb globalPointToLocal: aPoint).
	self trackLength isZero
		ifTrue: [ slideDelta := 0 ]
		ifFalse: [ slideDelta := handThumbPos / self trackLength ]