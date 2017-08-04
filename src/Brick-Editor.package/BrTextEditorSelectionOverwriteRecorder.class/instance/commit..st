selection
commit: aTextEditor
	"Commit recorded selection intervals in a given text editor"
		
	aTextEditor selection: selection.
	aTextEditor update: 1 to: aTextEditor text size.
	selection := BlCompositeTextSelection new