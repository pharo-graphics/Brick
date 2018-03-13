notifying
notifyToggleActivationChanged
	self isActivated
		ifTrue: [ self notifyToggleActivated ]
		ifFalse: [ self notifyToggleDeactivated ]