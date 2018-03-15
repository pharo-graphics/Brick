api - tab
disable
	self isDisabled
		ifTrue: [ ^ self ].

	enabled := false.
	self notifyTabDisabled.

	"disabled tab can not be selected anymore"
	self deselect