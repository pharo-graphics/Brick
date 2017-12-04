demo - model and ui
requestFrom: aUiElement to: aModelElement in: aContainer
	| uiModel requestChange |

	uiModel := BlParabollaArcElement new
		curvatureFraction: 0.3;
		border: (BlBorder paint: (Color gray alpha: 0.5) width: 2);
		fromAnchor: (BlElementLeftBottomAnchor element: aUiElement);
		toAnchor: (BlElementRightBottomAnchor element: aModelElement);
		toHead: (BlArrowheadSimpleArrow new
				arrowLengthFraction: 5;
				arrowNoseAngle: 60;
				border: (BlBorder builder paint: (Color gray alpha: 0.5); width: 2; build));
		constraintsDo: [ :c | c ignoreByLayout ].
	
	requestChange := BlTextElement text: ('request change' asRopedText).
	requestChange transformDo: [ :t | t scaleBy: 0.35 ].
	requestChange constraintsDo: [ :c | c ignoreByLayout ].
	requestChange relocate: 45@32.

	aContainer addChild: requestChange.
	aContainer addChild: uiModel