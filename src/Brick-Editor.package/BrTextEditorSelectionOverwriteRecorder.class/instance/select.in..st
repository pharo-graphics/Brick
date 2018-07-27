selection
select: aMonotoneTextSelection in: aTextEditor
	"Add a given selection to the list of recorded selections"
	
	(BrTextEditorRecordSelectionSignal new selection: aMonotoneTextSelection) emit.

	compositeSelection add: aMonotoneTextSelection.
	aTextEditor updateSelection: aMonotoneTextSelection from to: aMonotoneTextSelection to