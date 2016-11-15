as yet unclassified
positionThumb
	| allowedValue currentPosition trackPos |
	self orientation for: thumb length: self thumbLength.
	self orientation for: track breadth: (self breadthOf: thumb).
	allowedValue := widget scrollValue min: widget max max: widget min.
	currentPosition := self orientation positionFromPoint: thumb position.
	trackPos := allowedValue / widget max * self trackLength.
	trackPos > currentPosition
		ifTrue: [ trackPos := trackPos - currentPosition ]
		ifFalse: [ trackPos := (currentPosition - trackPos) negated ].
	self orientation translate: thumb by: trackPos