as yet unclassified
thumbDragged: aPoint
| handTrackPos trackPercent deltaPercent |
	self trackLength isZero ifTrue:[^ self].
	handTrackPos := self orientation positionFromPoint: (track globalPointToLocal: aPoint).
	trackPercent := handTrackPos / self trackLength.
	deltaPercent := slideDelta.
	self controller thumbDraggedPosition: trackPercent - deltaPercent