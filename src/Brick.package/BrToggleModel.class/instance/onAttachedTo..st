hooks
onAttachedTo: anElement
	super onAttachedTo: anElement.

	anElement when: BrLabelRequest do: [ self notifyLabelChanged ].
	anElement when: BrIconRequest do: [ self notifyIconChanged ].
	anElement when: BrToggleStateRequest do: [ self notifyToggleActivationChanged ].
	
	