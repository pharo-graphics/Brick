Class {
	#name : #BrDropdownExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Dropdown'
}

{ #category : #examples }
BrDropdownExamples >> alignedDropdowns [
	<gtExample>
	| container topLeft topCenter topRight centerLeft centerCenter centerRight bottomLeft bottomCenter bottomRight |
	container := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		padding: (BlInsets all: 10);
		layout: BlFrameLayout new.
	topLeft := self coloredDropdown
		constraintsDo: [ :c | 
			c frame horizontal alignLeft.
			c frame vertical alignTop ];
		yourself.
	topCenter := self coloredDropdown
		constraintsDo: [ :c | 
			c frame horizontal alignCenter.
			c frame vertical alignTop ];
		yourself.
	topRight := self coloredDropdown
		constraintsDo: [ :c | 
			c frame horizontal alignRight.
			c frame vertical alignTop ];
		yourself.
	centerLeft := self coloredDropdown
		constraintsDo: [ :c | 
			c frame horizontal alignLeft.
			c frame vertical alignCenter ];
		yourself.
	centerCenter := self coloredDropdown
		constraintsDo: [ :c | 
			c frame horizontal alignCenter.
			c frame vertical alignCenter ];
		yourself.
	centerRight := self coloredDropdown
		constraintsDo: [ :c | 
			c frame horizontal alignRight.
			c frame vertical alignCenter ];
		yourself.
	bottomLeft := self coloredDropdown
		constraintsDo: [ :c | 
			c frame horizontal alignLeft.
			c frame vertical alignBottom ];
		yourself.
	bottomCenter := self coloredDropdown
		constraintsDo: [ :c | 
			c frame horizontal alignCenter.
			c frame vertical alignBottom ];
		yourself.
	bottomRight := self coloredDropdown
		constraintsDo: [ :c | 
			c frame horizontal alignRight.
			c frame vertical alignBottom ];
		yourself.
	container
		addChildren:
			{topLeft.
			topCenter.
			topRight.
			centerLeft.
			centerCenter.
			centerRight.
			bottomLeft.
			bottomCenter.
			bottomRight}.
	^ container
]

{ #category : #'instance creation' }
BrDropdownExamples >> badgeButton [
	<gtExample>
	^ BrLabel new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		padding: (BlInsets all: 7);
		background: Color orange;
		text:
			('3' asRopedText
				fontSize: 15;
				foreground: Color white;
				bold);
		yourself
]

{ #category : #examples }
BrDropdownExamples >> coloredDropdown [
	<gtExample>
	| aButtonCircularLook aWithDropdownLook |
	
	aButtonCircularLook := [ BrInteractiveCommonLook new
		default: [ :e | e
			background: BrGlamorousColors defaultButtonBorderColor;
			border: (BlBorder
				paint: BrGlamorousColors defaultButtonBackgroundColor
				width: 3) ];
		hovered: [ :e | e background: BrGlamorousColors hoveredButtonBorderColor ] ] asStencil.

	aWithDropdownLook := BrGlamorousWithDropdownLook
		handle: [
			BrButton new
				size: 20 @ 20;
				geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
				look: aButtonCircularLook create ]
		content: [ 
			BrEditor new
				look: BrGlamorousCodeEditorLook;
				text:
					'<content>






</content>';
				padding: (BlInsets all: 10);
				matchParent;
				yourself ]
			lookDo: [ :aDropdownLook | aDropdownLook cornerRadius: 10 ].

	^ BrButton new
		size: 20 @ 20;
		geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
		label: 'howdy';
		look: aButtonCircularLook create + aWithDropdownLook;
		yourself
]

{ #category : #examples }
BrDropdownExamples >> compact [
	<gtExample>

	^ BrButton new
		look: BrGlamorousButtonWithLabelLook +
			(BrGlamorousWithDropdownLook
				handle: [
					BrButton new
						look: BrGlamorousButtonRectangularLook + BrGlamorousButtonLabelLook;
						label: 'click me';
						yourself ]
				content: [
					BlElement new
						background: (Color gray alpha: 0.2);
						size: 100 @ 100;
						margin: (BlInsets all: 10);
						yourself ]);
		label: 'click me';
		yourself
]

{ #category : #'examples - hide' }
BrDropdownExamples >> hideOnClickViaDropdownLook [
	<gtExample>
	| aWithDropdownLook |
	
	aWithDropdownLook := nil.
	aWithDropdownLook := BrGlamorousWithDropdownLook
		handle: [
			BrButton new
				look: BrGlamorousButtonRectangularLook + BrGlamorousButtonIconLook;
				icon: BrGlamorousIcons menu ]
		content: [ 
			BrButton new
				look: BrGlamorousButtonWithLabelLook new;
				label: 'Close';
				margin: (BlInsets all: 20);
				action: [ :aButton | aWithDropdownLook hide ] ].

	^ BrButton new
		look: BrGlamorousButtonWithIconLook + aWithDropdownLook;
		icon: BrGlamorousIcons menu;
		yourself
]

{ #category : #'examples - hide' }
BrDropdownExamples >> hideOnClickViaWish [
	<gtExample>
	| aWithDropdownLook |
	
	aWithDropdownLook := BrGlamorousWithDropdownLook
		handle: [
			BrButton new
				look: BrGlamorousButtonRectangularLook + BrGlamorousButtonIconLook;
				icon: BrGlamorousIcons menu ]
		content: [ 
			BrButton new
				look: BrGlamorousButtonWithLabelLook new;
				label: 'Close';
				margin: (BlInsets all: 20);
				action: [ :aButton | aButton fireEvent: BrDropdownHideWish new ] ].

	^ BrButton new
		look: BrGlamorousButtonWithIconLook + aWithDropdownLook;
		icon: BrGlamorousIcons menu;
		yourself
]

{ #category : #'examples - hide' }
BrDropdownExamples >> hideOnClickViaWishInNestedDropdown [
	<gtExample>
	| aWithDropdownLook |
	
	aWithDropdownLook := BrGlamorousWithDropdownLook
		handle: [
			BrButton new
				look: BrGlamorousButtonRectangularLook + BrGlamorousButtonIconLook;
				icon: BrGlamorousIcons menu ]
		content: [ 
			BrVerticalPane new
				fitContent;
				padding: (BlInsets all: 20);
				addChildren: { 
					BrButton new
						look: BrGlamorousButtonWithLabelLook new;
						label: 'Close';
						margin: (BlInsets bottom: 20);
						action: [ :aButton | aButton fireEvent: BrDropdownHideWish new ].
					BrButton new
						look: BrGlamorousButtonWithIconLook + (BrGlamorousWithDropdownLook
							handle: [
								BrButton new
									look: BrGlamorousButtonRectangularLook + BrGlamorousButtonIconLook;
									icon: BrGlamorousIcons menu ]
							content: [ 
								BrButton new
									look: BrGlamorousButtonWithLabelLook new;
									margin: (BlInsets all: 20);
									label: 'Close';
									action: [ :aButton | aButton fireEvent: BrDropdownHideWish new ] ]);
						icon: BrGlamorousIcons menu
					} ].

	^ BrButton new
		look: BrGlamorousButtonWithIconLook + aWithDropdownLook;
		icon: BrGlamorousIcons menu;
		yourself
]

{ #category : #'instance creation' }
BrDropdownExamples >> popupList [
	<gtExample>
	
	^ BrSimpleListExamples new allClasses
		lookDo: [ :aLook | aLook listElement constraintsDo: [ :c | c maxHeight: 200 ] ];
		layout: BlLinearLayout vertical;
		padding: (BlInsets all: 5);
		vFitContent;
		hExact: 200
]

{ #category : #examples }
BrDropdownExamples >> roundedDropdownList [
	<gtExample>

	^ self toggleButton
		look: BrGlamorousButtonWithLabelAndIconLook +
			(BrGlamorousWithDropdownLook
				handle: [
					self toggleButton
						look: BrGlamorousButtonWithLabelAndIconLook - BrGlamorousButtonExteriorLook;
						yourself ]
				content: [ self popupList ]);
		yourself
]

{ #category : #examples }
BrDropdownExamples >> scaledAndAlignedDropdowns [
	<gtExample>
	^ self alignedDropdowns
		constraintsDo: [ :c | c ignoreByLayout ];
		size: 200 @ 200;
		background: Color white;
		look: BrShadowLook new;
		padding: (BlInsets all: 10);
		margin: (BlInsets all: 10);
		transformDo: [ :t | t scaleBy: 2 @ 2 ];
		relocate: 120 @ 120;
		yourself
]

{ #category : #examples }
BrDropdownExamples >> suggesterBadgeDropdownList [
	<gtExample>

	^ self badgeButton
		look: BrTextLabelLook +
			(BrGlamorousWithDropdownLook new
				stencil: [
					BrAnchoredElement new
						look: (BrDropdownLook new
								handle:
									(self badgeButton
										look: BrTextLabelLook;
										yourself);
								content: (self popupList border: (BlBorder paint: Color orange width: 1));
								yourself);
						yourself ];
				yourself);
		relocate: 200 @ 100;
		yourself
]

{ #category : #'instance creation' }
BrDropdownExamples >> toggleButton [
	<gtExample>
	^ BrButton new
		label: 'Classes';
		icon:
			(BlElement new
				size: 8 @ 8;
				geometry:
					(BlPolygon
						vertices:
							{(0 @ 0).
							(8 @ 0).
							((8 / 2) rounded @ 8)});
				background: Color lightGray;
				margin: (BlInsets left: 6);
				constraintsDo: [ :c | c linear vertical alignCenter ]);
		yourself
]
