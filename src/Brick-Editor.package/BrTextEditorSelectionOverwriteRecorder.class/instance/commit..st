selection
commit: aTextEditor
	"Commit recorded selection intervals in a given text editor"
	
	aTextEditor selection: (BlCompositeSelection new add: self selection).
	aTextEditor updateSelection: 1 to: aTextEditor text size.

	compositeSelection := BlCompositeSelection new