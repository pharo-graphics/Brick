hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.

	anElement when: BrLabelRequest do: [ :anEvent | anEvent source dispatchEvent: ((BrLabelChanged new text: self label)) ].
	anElement when: BrIconRequest do: [ :anEvent | anEvent source dispatchEvent: (BrIconChanged new icon: self icon) ].
	anElement when: BrTabStateRequest
		do: [ :anEvent |
			anEvent source dispatchEvent: (self isSelected
				ifTrue: [ BrTabSelectedEvent tab: self ]
				ifFalse: [ BrTabDeselectedEvent tab: self ]).
			anEvent source dispatchEvent: (self isEnabled
				ifTrue: [ BrTabEnabledEvent tab: self ]
				ifFalse: [ BrTabDisabledEvent tab: self ]) ]