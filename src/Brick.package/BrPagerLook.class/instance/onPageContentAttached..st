hooks
onPageContentAttached: aPageContentElement
	| aPageModel aPageElement |

	aPageModel := aPageContentElement viewModel.

	aPageContentElement removeFromParent.
	aPageElement := (aPageModel decorator contentElement: aPageContentElement) asElement.	
	self pages at: aPageModel put: aPageElement.

	pagesListElement dataSource pageElements: self pageElements