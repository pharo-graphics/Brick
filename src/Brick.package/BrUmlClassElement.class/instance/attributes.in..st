accessing
attributes: aCollectionOfAttributes in: aContainerSymbol
	"Change a text within a container given by its name"
	
	self
		editorIn: aContainerSymbol
		do: [ :anEditorElement |
			| anEditor |
			anEditor := anEditorElement editor.
			anEditor text: (anEditor text attributes: aCollectionOfAttributes) ]