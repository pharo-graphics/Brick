selection
cancelSelection: anElement

	anElement
		dispatchEvent: BrDeselectionEvent new.

	anElement childrenDo: [ :each | self cancelSelection: each ]