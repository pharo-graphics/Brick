mouse handlers
mouseEnterEvent: anEvent
	self widget effect = self effect ifTrue: [ ^ self ].
	previousEffect := self widget effect.
	self effect input: nil.
	self widget effect: self effect.