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
	
	^ BrButton new
		background: Color orange;
		label: ('3' asRopedText fontSize: 15; foreground: Color white; bold);
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		look: BrTextLabelLook;
		padding: (BlInsets all: 7)
]

{ #category : #'as yet unclassified' }
BrDropdownExamples >> coloredDropdown [
	<gtExample>
	| dropdown look |
	dropdown := BrDropdown new.
	look := BrGlamorousDropdownLook new.
	look
		reusePopup: true;
		outskirtsEmbellisher: [ :e | 
			dropdown viewModel children first stateModels first isExpanded
				ifTrue: [ e
						background: Color white;
						border: (BlBorder paint: Color white asBlPaint width: 3) ]
				ifFalse: [ e look
						ifNil: [ e look: BrShadowLook ]
						ifNotNil: [ (e look hasActor: BrShadowLook) ifFalse: [ e look add: BrShadowLook ] ] ].
			e ].
	dropdown
		layout: BlLinearLayout horizontal;
		look: look;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		clipChildren: false;
		toggle: [ BrButton new
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
				yourself ];
		popup: [ BlElement new
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
				yourself ].
	^ dropdown
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

{ #category : #'instance creation' }
BrDropdownExamples >> roundLook [
	<gtExample>

	^ BrGlamorousDropdownLook new
]

{ #category : #examples }
BrDropdownExamples >> roundedDropdownList [
	<gtExample>
	^ BrDropdown new
		layout: BlLinearLayout horizontal;
		relocate: 200 @ 100;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		in: [ :aDropdown | aDropdown toggle: [ self toggleButton ] ];
		popup: [ self popupList ];
		look: BrDropdownExamples new roundLook
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
	| aDropdown |
	aDropdown := BrDropdown new
		layout: BlLinearLayout horizontal;
		relocate: 200 @ 100;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ].
	aDropdown toggle: [ self badgeButton ].
	aDropdown popup: [ self popupList ].
	aDropdown look: BrGlamorousDropdownLook new.
	^ aDropdown
]

{ #category : #'instance creation' }
BrDropdownExamples >> toggleButton [
	<gtExample>

	^ BrButton new
		look: BrGlamorousButtonWithLabelAndIconLook;
		padding: (BlInsets top: 6 right: 8 bottom: 6 left: 15);
		label: 'instance';
		icon: (BlElement new
			size: 8@8;
			geometry: (BlPolygon vertices: {(0 @ 0). (8 @ 0). ((8 / 2) rounded @ 8)});
			background: Color lightGray;
			margin: (BlInsets left: 12 right: 10);
			constraintsDo: [ :c | c linear vertical alignCenter ])
]
