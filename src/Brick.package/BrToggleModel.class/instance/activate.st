api - toggle
activate
	self isActivated
		ifTrue: [ ^ self ].

	activated := true.
	self notifyToggleActivated