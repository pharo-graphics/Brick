Class {
	#name : #BrDropdownExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Dropdown'
}

{ #category : #'as yet unclassified' }
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

{ #category : #accessing }
BrDropdownExamples >> coloredDropdown [
	<gtExample>
	^ BrButton new
		size: 20 @ 20;
		geometry: (BlRectangle cornerRadius: 10);
		label: 'howdy';
		look:
			(BrInteractiveCommonLook new
				default: [ :e | 
					e
						background: BrGlamorousColors defaultButtonBorderColor;
						border:
							(BlBorder
								paint: BrGlamorousColors defaultButtonBackgroundColor
								width: 3) ];
				hovered: [ :e | 
					e
						background: BrGlamorousColors hoveredButtonBorderColor;
						border:
							(BlBorder
								paint: BrGlamorousColors defaultButtonBackgroundColor
								width: 3) ]) + BrGlamorousButtonWithLabelTooltipLook
				+
					(BrGlamorousWithContextMenuLook
						content: [ BrGlamorousSimpleContextMenuContent new
								display:
									{('Change to blue' -> [ :e | e background: Color blue ]).
									('Change to red' -> [ :e | e background: Color red ]).
									('Change to green' -> [ :e | e background: Color green ])};
								yourself ])
				+
					(BrGlamorousWithDropdownLook
						stencil: [ BrAnchoredElement new
								look:
									(BrGlamorousDropdownLook new
										handle:
											(BrButton new
												size: 20 @ 20;
												geometry: (BlRectangle cornerRadius: 10);
												look:
													(BrInteractiveCommonLook new
														default: [ :e | 
															e
																background: BrGlamorousColors defaultButtonBorderColor;
																border:
																	(BlBorder
																		paint: BrGlamorousColors defaultButtonBackgroundColor
																		width: 3) ];
														hovered: [ :e | 
															e
																background: BrGlamorousColors hoveredButtonBorderColor;
																border:
																	(BlBorder
																		paint: BrGlamorousColors defaultButtonBackgroundColor
																		width: 3) ]);
												yourself);
										content:
											(BlElement new
												layout: BlLinearLayout vertical;
												constraintsDo: [ :c | 
													c horizontal fitContent.
													c vertical fitContent ];
												addChild:
													(BrEditor new
														look: BrGlamorousCodeEditorLook;
														text:
															'<content>






</content>';
														padding: (BlInsets all: 10);
														constraintsDo: [ :c | 
															c horizontal matchParent.
															c vertical matchParent ];
														yourself);
												yourself);
										yourself);
								in: [ :e | e geometry: (BrAnchoredGeometry cornerRadius: 10 element: e) ];
								yourself ]);
		yourself
]

{ #category : #private }
BrDropdownExamples >> compact [
	<gtExample>
	| element |
	element := BrButton new
		look:
			BrGlamorousButtonWithLabelLook
				+
					(BrGlamorousWithDropdownLook
						handle: [ BrButton new
								look: BrGlamorousButtonRectangularLook + BrGlamorousButtonLabelLook;
								label: 'click me';
								yourself ]
						content: [ BlElement new
								background: Color white;
								size: 100 @ 200;
								yourself ]);
		label: 'click me';
		yourself.
	^ element
]

{ #category : #'instance creation' }
BrDropdownExamples >> popupList [
	<gtExample>
	
	^ BrSimpleListExamples new exampleWithSelection
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
		look:
			BrGlamorousButtonWithLabelAndIconLook
				+
					(BrGlamorousWithDropdownLook
						handle: [ self toggleButton
								look:
									BrGlamorousButtonWithLabelAndIconLook - BrGlamorousButtonExteriorLook;
								yourself ]
						content: [ self popupList ]);
		relocate: 200 @ 100;
		yourself
]

{ #category : #'as yet unclassified' }
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
		look:
			BrTextLabelLook
				+
					(BrWithDropdownLook new
						stencil: [ BrAnchoredElement new
								look:
									(BrDropdownLook new
										handle:
											(self badgeButton
												look: BrTextLabelLook;
												yourself);
										content: self popupList;
										yourself);
								border: (BlBorder paint: Color orange width: 1);
								yourself ];
						yourself);
		relocate: 200 @ 100;
		yourself
]

{ #category : #'instance creation' }
BrDropdownExamples >> toggleButton [
	<gtExample>
	^ BrButton new
		label: 'instance';
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
