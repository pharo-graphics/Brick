as yet unclassified
trackMouseDown: anEvent
	| localPosition percentPosition |
	
	localPosition := self orientation positionFromPoint: (track globalPointToLocal: anEvent position).
	percentPosition := (localPosition - (self thumbLength / 2)) / self trackLength.
	self controller trackPressPosition: percentPosition