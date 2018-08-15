api - adding / removing
addPageWithContent: aContentElement	
	| aPageElement |
	
	aPageElement := BlElement new.
	aPageElement
		viewModel: BrPagerPageModel new;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ].
	aPageElement addChild: aContentElement.

	self addPage: aPageElement