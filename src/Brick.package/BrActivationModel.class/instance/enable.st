api - activation
enable
	self isEnabled
		ifTrue: [ ^ self ].

	enabled := true.
	self notifyActivationChanged