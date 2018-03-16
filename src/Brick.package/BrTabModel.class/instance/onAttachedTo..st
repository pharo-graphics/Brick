hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.

	self when: BrLabelRequest reply: [ BrLabelChanged new text: self label ].
	self when: BrIconRequest reply: [ BrIconChanged new icon: self icon ].

	anElement when: BrTabStateRequest
		do: [ :anEvent |
			anEvent source dispatchEvent: (self isSelected
				ifTrue: [ BrTabSelectedEvent tab: self ]
				ifFalse: [ BrTabDeselectedEvent tab: self ]).
			anEvent source dispatchEvent: (self isEnabled
				ifTrue: [ BrTabEnabledEvent tab: self ]
				ifFalse: [ BrTabDisabledEvent tab: self ]) ]