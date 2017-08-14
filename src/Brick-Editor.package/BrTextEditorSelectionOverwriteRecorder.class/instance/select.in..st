selection
select: aMonotoneTextSelection in: aTextEditor
	"Add a given selection to the list of recorded selections"
		
	compositeSelection add: aMonotoneTextSelection.
	selection := compositeSelection isEmpty
		ifTrue: [ BlMonotoneTextSelection new ]
		ifFalse: [ BlMonotoneTextSelection from: compositeSelection from to: compositeSelection to ].
	
	aTextEditor updateSelection: aMonotoneTextSelection from to: aMonotoneTextSelection to