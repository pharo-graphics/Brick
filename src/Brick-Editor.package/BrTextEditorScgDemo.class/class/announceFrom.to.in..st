demo - model and ui
announceFrom: aModelElement to: aUiElement in: aContainer
	| uiModel announceUpdate |
	
	uiModel := BlParabollaArcElement new
		curvatureFraction: 0.3;
		border: (BlBorder paint: (Color gray alpha: 0.5) width: 2);
		fromAnchor: (BlElementRightTopAnchor element: aModelElement);
		toAnchor: (BlElementLeftTopAnchor element: aUiElement);
		toHead: (BlArrowheadSimpleArrow new
				arrowLengthFraction: 5;
				arrowNoseAngle: 60;
				border: (BlBorder builder paint: (Color gray alpha: 0.5); width: 2; build));
		constraintsDo: [ :c | c ignoreByLayout ].
	
	announceUpdate := BlTextElement text: ('announce update' asRopedText).
	announceUpdate transformDo: [ :t | t scaleBy: 0.35 ].
	announceUpdate constraintsDo: [ :c | c ignoreByLayout ].
	announceUpdate relocate: 38@(12 negated).

	aContainer addChild: announceUpdate.
	aContainer addChild: uiModel