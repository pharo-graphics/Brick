hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.

	anElement
		when: BrActivationRequest
		do: [ :anEvent | anEvent source dispatchEvent: (BrActivationChanged enabled: self isEnabled) ]