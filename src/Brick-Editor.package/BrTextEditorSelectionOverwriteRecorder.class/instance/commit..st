selection
commit: aTextEditor
	"Commit recorded selection intervals in a given text editor"
		
	aTextEditor selection: (BlCompositeTextSelection new add: self selection).
	aTextEditor updateSelection: 1 to: aTextEditor text size.

	compositeSelection := BlCompositeTextSelection new.
	selection := BlMonotoneTextSelection new