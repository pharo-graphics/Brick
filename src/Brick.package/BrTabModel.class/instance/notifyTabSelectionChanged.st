notifying
notifyTabSelectionChanged
	self isSelected
		ifTrue: [ self notifyTabSelected ]
		ifFalse: [ self notifyTabDeselected ]