hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.

	anElement when: BrLabelRequest do: [ :anEvent | anEvent source dispatchEvent: (BrLabelChanged new text: self label) ].
	anElement when: BrIconRequest do: [ :anEvent | anEvent source dispatchEvent: (BrIconChanged new icon: self icon) ].
	anElement when: BrToggleStateRequest
		do: [ :anEvent |
			anEvent source dispatchEvent: (self isActivated
				ifTrue: [ BrToggleActivatedEvent new ]
				ifFalse: [ BrToggleDeactivatedEvent new ]).
			anEvent source dispatchEvent: (self isEnabled
				ifTrue: [ BrToggleEnabledEvent new ]
				ifFalse: [ BrToggleDisabledEvent new ]) ]