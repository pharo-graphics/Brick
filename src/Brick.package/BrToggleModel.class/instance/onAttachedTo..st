hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.

	self when: BrLabelRequest reply: [ BrLabelChanged new text: self label ].
	self when: BrIconRequest reply: [ BrIconChanged new icon: self icon ].
	
	self when: BrToggleStateRequest do: [
		self isActivated
			ifTrue: [ BrToggleActivatedEvent toggle: self ]
			ifFalse: [ BrToggleDeactivatedEvent toggle: self ] ].

	self when: BrToggleStateRequest do: [
		self isEnabled
			ifTrue: [ BrToggleEnabledEvent toggle: self ]
			ifFalse: [ BrToggleDisabledEvent toggle: self ] ]