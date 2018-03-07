state management
toggleState: aState
	(self hasActiveState: aState)
		ifTrue: [ self deactivateState: aState ]
		ifFalse: [ self activateState: aState ].