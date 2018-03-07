state management
deactivateState: aState
	(self hasActiveState: aState)
		ifFalse: [ ^ self ].
	self states remove: aState