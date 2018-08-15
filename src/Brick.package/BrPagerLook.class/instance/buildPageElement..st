instance creation
buildPageElement: aContentElement
	<return: #BlElement>
	| aPageElement aResizer |

	aPageElement := BlElement new
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
		addEventHandler: (BlResizerBottomRightListener new resizeTarget: aPageElement; minimumExtent: 75@75).
		
	aPageElement addChild: aContentElement.
	aPageElement addChild: aResizer.
	
	^ aPageElement