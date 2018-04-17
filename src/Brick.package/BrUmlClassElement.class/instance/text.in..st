accessing
text: aBrText in: aContainerSymbol
	"Change a text within a container given by its name"
	
	self
		editorIn: aContainerSymbol
		do: [ :anEditorElement | anEditorElement editor text: aBrText asRopedText ]