instance creation
createElement: anEditorElement
	<return: #BlElement>

	^ (anEditorElement editor segmentBuilder wordStencilBuilder
		text: self text;
		editorElement: anEditorElement) asElement