selection
deselect: aMonotoneTextSelection in: aTextEditor		
		
	compositeSelection remove: aMonotoneTextSelection.
	selection := compositeSelection isEmpty
		ifTrue: [ BlMonotoneTextSelection new ]
		ifFalse: [ BlMonotoneTextSelection from: compositeSelection from to: compositeSelection to ].

	aTextEditor updateSelection: aMonotoneTextSelection from to: aMonotoneTextSelection to