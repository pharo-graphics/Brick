example
example
	<gtExample>
	
	| page1 page2 page3 pager |
	page1 := BrWidgetModel new.
	page2 := BrWidgetModel new.
	page3 := BrWidgetModel new.

	{ 
		page1. page2. page3
	} do: [ :each |
		| aPage aResizer |
		aPage := BlElement new
			viewModel: each;
			background: Color random paler;
			margin: (BlInsets all: 10);
			constraintsDo: [ :c |
				c horizontal exact: 200.
				c vertical exact: 200 ].
		aResizer := BlElement new
			background: Color black;
			constraintsDo: [ :c |
				c ignoreByLayout.
				c vertical exact: 7.
				c horizontal exact: 7.
				c ignored vertical alignBottom.
				c ignored horizontal alignRight ];
			addEventHandler: (BlResizerBottomRightListener new resizeTarget: aPage; minimumExtent: 75@75).

		aPage addChild: aResizer
	].

	pager := BrPager new.
	pager constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent
	].

	pager viewModel pages: { 
		page1. page2. page3
	}.
	^ pager