hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.

	anElement when: BrTabStateRequest
		do: [ :anEvent |
			anEvent source dispatchEvent: (self isSelected
				ifTrue: [ BrTabSelectedEvent tab: self ]
				ifFalse: [ BrTabDeselectedEvent tab: self ]) ]