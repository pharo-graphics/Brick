as yet unclassified
updatePagePreviews

	scrollbarElement removeChildren.

	self pageElements do: [ :aPageContentElement |
		scrollbarElement addChild: (self buildPreviewOfThePage: aPageContentElement) ]