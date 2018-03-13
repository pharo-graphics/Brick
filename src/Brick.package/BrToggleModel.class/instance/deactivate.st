api - toggle
deactivate
	self isActivated
		ifFalse: [ ^ self ].

	activated := false.
	self notifyToggleDeactivated