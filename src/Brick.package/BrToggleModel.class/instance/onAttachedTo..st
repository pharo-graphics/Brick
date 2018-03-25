hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.

	self when: BrLabelRequest reply: [ BrLabelChanged new text: self label ].
	self when: BrIconRequest reply: [ BrIconChanged new icon: self icon ].

	anElement when: BrToggleStateRequest
		do: [ :anEvent |
			anEvent source dispatchEvent: (self isActivated
				ifTrue: [ BrToggleActivatedEvent new ]
				ifFalse: [ BrToggleDeactivatedEvent new ]).
			anEvent source dispatchEvent: (self isEnabled
				ifTrue: [ BrToggleEnabledEvent new ]
				ifFalse: [ BrToggleDisabledEvent new ]) ]