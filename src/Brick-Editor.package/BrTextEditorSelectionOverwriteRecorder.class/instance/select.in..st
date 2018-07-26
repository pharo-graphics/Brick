selection
select: aMonotoneTextSelection in: aTextEditor
	"Add a given selection to the list of recorded selections"
	
	compositeSelection add: aMonotoneTextSelection.
	aTextEditor updateSelection: aMonotoneTextSelection from to: aMonotoneTextSelection to