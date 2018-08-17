testing
hasPageAfter: aPageModel
	| aPageIndex |
	aPageIndex := self pages
		indexOf: aPageModel
		ifAbsent: [ ^ false ].
	^ aPageIndex < self pages size