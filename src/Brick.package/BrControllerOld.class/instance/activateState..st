state management
activateState: aState
	(self hasActiveState: aState)
		ifTrue: [ ^ self ].
	self states add: aState.