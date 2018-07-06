accessing
affect: aBlText in: anEditorElement
	<return: #BlElement>

	^ stencilBuilder
		text: aBlText;
		editor: anEditorElement;
		asElement