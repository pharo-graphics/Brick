private
updateSelection
	| aSelectionCopy newSelection |
	
	deletionIntervals do: [ :aMonotoneSelection | self editor deselect: aMonotoneSelection from to: aMonotoneSelection to ].
	
	aSelectionCopy := BlCompositeSelection new select: self selection.
	aSelectionCopy deselect: deletionIntervals.
	
	newSelection := BlCompositeSelection new.
	aSelectionCopy do: [ :eachSelection |
		| aSelectionDelta |
		
		aSelectionDelta := self computeSelectionMovement: eachSelection.
		newSelection select: (eachSelection from + aSelectionDelta) to: (eachSelection to + aSelectionDelta) ].
	
	self editor selection: newSelection