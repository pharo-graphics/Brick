selection
select: aMonotoneTextSelection in: aTextEditor
	"Add a given selection to the list of recorded selections"
		
	selection add: aMonotoneTextSelection.
	aTextEditor updateSelection: aMonotoneTextSelection from to: aMonotoneTextSelection to