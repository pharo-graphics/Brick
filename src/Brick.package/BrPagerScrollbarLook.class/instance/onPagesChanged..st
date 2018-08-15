hooks
onPagesChanged: aCollectionOfModels

	self pages removeAll.
	aCollectionOfModels do: [ :aPageModel |
		self pages at: aPageModel put: nil ].

	aCollectionOfModels do: [ :aPageModel |
		aPageModel whenAttachedDo: [ :aPageElement |
			self pages at: aPageModel put: aPageElement.
			scrollbarElement  ] ]