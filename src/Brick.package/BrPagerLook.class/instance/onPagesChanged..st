hooks
onPagesChanged: aCollectionOfModels
	
	self pages removeAll.
	aCollectionOfModels do: [ :aPageModel |
		self pages at: aPageModel put: nil ].

	aCollectionOfModels do: [ :aPageModel |
		aPageModel whenAttachedDo: [ :aPageContentElement |
			| aPageElement |
			
			aPageContentElement removeFromParent.
			aPageElement := self buildPageElement: aPageContentElement.
			self pages at: aPageModel put: aPageElement.
			pagesListElement dataSource pageElements: self pageElements ] ]