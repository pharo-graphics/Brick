instance creation
buildPreviewOfThePage: aPageContentElement
	| aPreviewElement |
	aPageContentElement removeEventHandlersSuchThat: [ :each | each isKindOf: BrPagerPagePreviewResizeListener ].

	aPreviewElement := BlElement new
		margin: (BlInsets all: 3);
		border: (BlBorder paint: Color gray width: 2).
		
	aPageContentElement addEventHandler: (BrPagerPagePreviewResizeListener new previewElement: aPreviewElement).
	
	^ aPreviewElement