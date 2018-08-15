api - adding / removing
removePagesAfter: aPageModel
	| aPageIndex |
	
	aPageIndex := self pages
		indexOf: aPageModel
		ifAbsent: [ ^ self ].
	
	aPageIndex = self pages size
		ifTrue: [ ^ self ].
	
	self removePagesAfterIndex: aPageIndex + 1