Class {
	#name : #BrDropdownExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Dropdown'
}

{ #category : #examples }
BrDropdownExamples >> dropdown [
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

{ #category : #'instance creation' }
BrDropdownExamples >> popupList [
	<gtExample>
	
	^ BrSimpleListExamples new exampleWithSelection
		lookDo: [ :aLook | aLook listElement constraintsDo: [ :c |
			c vertical fitContent.
			c horizontal matchParent.
			c maxHeight: 200 ] ];
		layout: BlLinearLayout vertical;
		padding: (BlInsets all: 5);
		constraintsDo: [ :c |
			c vertical fitContent.
			c horizontal exact: 200 ]
]

{ #category : #'instance creation' }
BrDropdownExamples >> roundLook [
	<gtExample>

	^ BrDropdownLook new outskirtsEmbellisher: [ :e | e look: BrDropdownOutskirtsLook new ]
]

{ #category : #'instance creation' }
BrDropdownExamples >> toggleButton [
	<gtExample>
	
	^ BrButton new
		look: BrGlamorousLabelLook + BrGlamorousButtonIconLook + BrLayoutLook linearHorizontal fitContent;
		padding: (BlInsets top: 6 right: 8 bottom: 6 left: 15);
		label: 'instance';
		icon: (BlElement new
			size: 8@8;
			geometry:
			(BlPolygon
				vertices:
					{(0 @ 0).
					(8 @ 0).
					((8 / 2) rounded @ 8)});
			background: Color lightGray;
			margin: (BlInsets left: 12 right: 10);
			constraintsDo: [ :c | c linear vertical alignCenter ])
]
