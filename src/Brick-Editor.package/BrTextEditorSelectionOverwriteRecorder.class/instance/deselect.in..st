selection
deselect: aMonotoneTextSelection in: aTextEditor		
	compositeSelection remove: aMonotoneTextSelection.
	aTextEditor updateSelection: aMonotoneTextSelection from to: aMonotoneTextSelection to