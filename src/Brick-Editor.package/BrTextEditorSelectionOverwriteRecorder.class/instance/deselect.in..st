selection
deselect: aMonotoneTextSelection in: aTextEditor		
	selection remove: aMonotoneTextSelection.	
	aTextEditor update: aMonotoneTextSelection from to: aMonotoneTextSelection to