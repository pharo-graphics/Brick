api - tab
enable
	self isEnabled
		ifTrue: [ ^ self ].

	enabled := true.
	self notifyTabEnabled