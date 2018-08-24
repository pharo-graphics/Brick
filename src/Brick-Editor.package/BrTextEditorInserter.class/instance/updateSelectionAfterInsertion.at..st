private
updateSelectionAfterInsertion: aText at: anIndex
	| anExistingSelection |
	
	anExistingSelection := BlCompositeSelection new select: self editor selection.
	anExistingSelection reverseDo: [ :aMonotoneSelection |
		| aNewSelection |
		
		aNewSelection := self computeSelection: aMonotoneSelection afterInserted: aText at: anIndex.
		aNewSelection = aMonotoneSelection
			ifFalse: [
				self editor deselect: aMonotoneSelection from to: aMonotoneSelection to.
				self editor select: aNewSelection from to: aNewSelection to ] ]