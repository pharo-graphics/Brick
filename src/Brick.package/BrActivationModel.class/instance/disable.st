api - activation
disable
	self isDisabled
		ifTrue: [ ^ self ].

	enabled := false.
	self notifyActivationChanged