selection
deselect: aMonotoneTextSelection in: aTextEditor		
	selection remove: aMonotoneTextSelection.	
	aTextEditor updateSelection: aMonotoneTextSelection from to: aMonotoneTextSelection to