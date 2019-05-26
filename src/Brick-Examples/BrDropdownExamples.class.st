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
