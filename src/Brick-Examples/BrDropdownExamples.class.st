Class {
	#name : #BrDropdownExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Dropdown'
}

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
	| dropdown |
	dropdown := BrDropdown new
		layout: BlLinearLayout horizontal;
		background: Color green;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		toggle: [ BlElement new
				size: 20 @ 20;
				background: Color blue;
				when: BlClickEvent do: [ dropdown toggle ] ];
		popup: [ BlElement new
				size: 120 @ 150;
				background: Color red ].
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
		relocate: 200@100;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		in: [ :aDropdown | aDropdown toggle: [ self toggleButton action: [ aDropdown toggle ] ] ];
		popup: [ self popupList ];
		look: (BrDropdownExamples new roundLook)
]

{ #category : #'as yet unclassified' }
BrDropdownExamples >> scaledAndAlignedDropdowns [
	<gtExample>
	| container topLeft topCenter topRight centerLeft centerCenter centerRight bottomLeft bottomCenter bottomRight |
	container := BlElement new.
	container
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	container size: 200 @ 200.
	container background: Color gray.
	container layout: BlFrameLayout new.
	container transformDo: [ :t | t scaleBy: 2 @ 2 ].
	container relocate: 100 @ 100.
	topLeft := self coloredDropdown
		constraintsDo: [ :c | 
			c frame horizontal alignLeft.
			c frame vertical alignTop ];
		look: (BrGlamorousDropdownLook new dropdownTarget: [ container ]);
		yourself.
	topCenter := self coloredDropdown
		constraintsDo: [ :c | 
			c frame horizontal alignCenter.
			c frame vertical alignTop ];
		look: (BrGlamorousDropdownLook new dropdownTarget: [ container ]);
		yourself.
	topRight := self coloredDropdown
		constraintsDo: [ :c | 
			c frame horizontal alignRight.
			c frame vertical alignTop ];
		look: (BrGlamorousDropdownLook new dropdownTarget: [ container ]);
		yourself.
	centerLeft := self coloredDropdown
		constraintsDo: [ :c | 
			c frame horizontal alignLeft.
			c frame vertical alignCenter ];
		look: (BrGlamorousDropdownLook new dropdownTarget: [ container ]);
		yourself.
	centerCenter := self coloredDropdown
		constraintsDo: [ :c | 
			c frame horizontal alignCenter.
			c frame vertical alignCenter ];
		look: (BrGlamorousDropdownLook new dropdownTarget: [ container ]);
		yourself.
	centerRight := self coloredDropdown
		constraintsDo: [ :c | 
			c frame horizontal alignRight.
			c frame vertical alignCenter ];
		look: (BrGlamorousDropdownLook new dropdownTarget: [ container ]);
		yourself.
	bottomLeft := self coloredDropdown
		constraintsDo: [ :c | 
			c frame horizontal alignLeft.
			c frame vertical alignBottom ];
		look: (BrGlamorousDropdownLook new dropdownTarget: [ container ]);
		yourself.
	bottomCenter := self coloredDropdown
		constraintsDo: [ :c | 
			c frame horizontal alignCenter.
			c frame vertical alignBottom ];
		look: (BrGlamorousDropdownLook new dropdownTarget: [ container ]);
		yourself.
	bottomRight := self coloredDropdown
		constraintsDo: [ :c | 
			c frame horizontal alignRight.
			c frame vertical alignBottom ];
		look: (BrGlamorousDropdownLook new dropdownTarget: [ container ]);
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

{ #category : #examples }
BrDropdownExamples >> suggesterBadgeDropdownList [
	<gtExample>
	| aDropdown |
	
	aDropdown := BrDropdown new
		layout: BlLinearLayout horizontal;
		relocate: 200@100;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ].
	aDropdown toggle: [ self badgeButton action: [ aDropdown toggle ] ].
	aDropdown popup: [ self popupList ].	
	aDropdown look: (BrGlamorousDropdownLook new
		"popupEmbellisher: [ :aPopupElement :aToggleStencil | 
			| aContainer aPopupWrapper |
			
			aPopupWrapper := BlElement new
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c |
					c horizontal fitContent.
					c vertical fitContent ].
				
			aPopupWrapper addChild: aPopupElement.
			aPopupWrapper border: (BlBorder paint: Color orange width: 1).
			aPopupWrapper background: Color white.
			
			aContainer := BlElement new.
			aContainer clipChildren: false.
			aContainer layout: BlLinearLayout vertical.
			aContainer constraintsDo: [ :c |
				c horizontal fitContent.
				c vertical fitContent ].
			aContainer addChild: (aToggleStencil asElement elevation: (BlRelativeElevation elevation: 2)).
			aContainer addChild: aPopupWrapper ];
		outskirtsEmbellisher: [ :anElement | anElement ]").
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
