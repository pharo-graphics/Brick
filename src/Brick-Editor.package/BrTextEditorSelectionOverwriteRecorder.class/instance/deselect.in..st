selection
deselect: aMonotoneTextSelection in: aTextEditor

	(BrTextEditorRecordDeselectionSignal new selection: aMonotoneTextSelection) emit.

	compositeSelection remove: aMonotoneTextSelection.
	aTextEditor updateSelection: aMonotoneTextSelection from to: aMonotoneTextSelection to