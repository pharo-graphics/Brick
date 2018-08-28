"
A collection of ""showroom"" examples
"
Class {
	#name : #BrExamplesShowroom,
	#superclass : #Object,
	#category : #'Brick-Examples-! Showroom'
}

{ #category : #buttons }
BrExamplesShowroom >> glamorousButton [
	<gtExample>
	
	^ BrButton new
		look: BrGlamorousButtonLook new;
		label: 'Button'
]

{ #category : #buttons }
BrExamplesShowroom >> glamorousDisabledButton [
	<gtExample>
	
	^ BrButton new
		look: BrGlamorousButtonLook new;
		label: 'Disabled';
		disable
]

{ #category : #tabs }
BrExamplesShowroom >> glamorousTabs [
	<gtExample>
	<description: 'Tabs with glamorous look'>
	| aTabGroup |

	aTabGroup := BrTabGroup new.
	aTabGroup look: BrGlamorousTabGroupLook new.

	aTabGroup addTab: (BrTab new
		look: BrGlamorousTabLook new;
		label: 'Tab 1';
		stencil: [ BlElement new
			constraintsDo: [ :c |
				c horizontal exact: 300.
				c vertical matchParent ];
			margin: (BlInsets all: 10);
			background: (Color red alpha: 0.2) ]).
		
	aTabGroup addTab: (BrTab new
		look: BrGlamorousTabLook new;
		label: 'Tab 2';
		stencil: [ BlElement new
			margin: (BlInsets all: 10);
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical matchParent ];
			background: (Color blue alpha: 0.2) ]).
		
	aTabGroup addTab: (BrTab new
		look: BrGlamorousTabLook new;
		label: 'Tab 3';
		stencil: [ BlElement new
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical exact: 300 ];
			margin: (BlInsets all: 10);
			background: (Color orange alpha: 0.2) ]).

	^ aTabGroup
]

{ #category : #toolbar }
BrExamplesShowroom >> glamorousToolbar [
	<gtExample>
	<description: 'Toolbar with glamorous look'>
	| aToolbar |
	
	aToolbar := BrToolbar new.
	aToolbar look: BrGlamorousToolbarLook new.
	
	aToolbar addItem: (BrButton new
		look: BrGlamorousButtonLook new;
		label: 'Button 1').
		
	aToolbar addItem: (BrButton new
		look: BrGlamorousButtonLook new;
		label: 'Button 2').
	
	aToolbar addItem: (BrButton new
		look: BrGlamorousButtonLook new;
		label: 'Button 3').
	
	^ aToolbar
]

{ #category : #buttons }
BrExamplesShowroom >> materialButton [
	<gtExample>
	
	^ BrButton new
		look: BrMaterialButtonLook new;
		label: 'Button'
]

{ #category : #buttons }
BrExamplesShowroom >> materialDisabledButton [
	<gtExample>
	
	^ BrButton new
		look: BrMaterialButtonLook new;
		label: 'Disabled';
		disable
]

{ #category : #tabs }
BrExamplesShowroom >> materialTabs [
	<gtExample>
	<description: 'Tabs with material look'>
	| aTabGroup |

	aTabGroup := BrTabGroup new.
	aTabGroup look: BrMaterialTabGroupLook new.

	aTabGroup addTab: (BrTab new
		look: BrMaterialTabLook new;
		label: 'Tab 1';
		stencil: [ BlElement new
			constraintsDo: [ :c |
				c horizontal exact: 300.
				c vertical matchParent ];
			margin: (BlInsets all: 10);
			background: (Color red alpha: 0.2) ]).

	aTabGroup addTab: (BrTab new
		look: BrMaterialTabLook new;
		label: 'Tab 2';
		stencil: [ BlElement new
			margin: (BlInsets all: 10);
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical matchParent ];
			background: (Color blue alpha: 0.2) ]).

	aTabGroup addTab: (BrTab new
		look: BrMaterialTabLook new;
		label: 'Tab 3';
		stencil: [ BlElement new
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical exact: 300 ];
			margin: (BlInsets all: 10);
			background: (Color orange alpha: 0.2) ]).

	^ aTabGroup
]

{ #category : #toolbar }
BrExamplesShowroom >> materialToolbar [
	<gtExample>
	<description: 'Toolbar with material look'>
	| aToolbar |
	
	aToolbar := BrToolbar new.
	aToolbar look: BrMaterialToolbarLook new.
	
	aToolbar addItem: (BrButton new
		look: BrMaterialButtonLook new;
		label: 'Button 1').

	aToolbar addItem: (BrButton new
		look: BrMaterialButtonLook new;
		label: 'Button 2').
	
	aToolbar addItem: (BrButton new
		look: BrMaterialButtonLook new;
		label: 'Button 3').
	
	^ aToolbar
]
