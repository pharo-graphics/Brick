api - tab
deselect
	self isSelected
		ifFalse: [ ^ self ].

	selected := false.
	self notifyTabDeselected