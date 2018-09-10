"
I am a collection of ""showroom"" examples.

! Buttons

In the example below we show all existing button styles
${example:BrExamplesShowroom class>>#allButtons|expanded|noCode}$

The following glamorous button reacts to  various UI interaction events and changes its style according the state (pressed, hovered)
${example:BrExamplesShowroom>>#glamorousButton}$

Button can also be disabled to prevent click events
${example:BrExamplesShowroom>>#glamorousDisabledButton}$

"
Class {
	#name : #BrExamplesShowroom,
	#superclass : #Object,
	#category : #'Brick-Examples-! Showroom'
}

{ #category : #buttons }
BrExamplesShowroom class >> allButtons [
	<gtExample>

	^ BlElement new
		layout: (BlGridLayout new cellSpacing: 30);
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent
		];
		addChildren: { 
			self new glamorousButton.
			self new glamorousDisabledButton.
			self new materialButton
		}
]

{ #category : #buttons }
BrExamplesShowroom class >> allToggles [
	<gtExample>

	^ BlElement new
		layout: (BlGridLayout new cellSpacing: 30; columnCount: 3);
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent
		];
		addChildren: { 
			self new hydraToggle.
			self new hydraWithTrackToggle.
			self new hydraWithoutTrackToggle.
			self new materialIconToggle.
			self new materialLabelToggle.
			self new materialToggle
			
		}
]

{ #category : #list }
BrExamplesShowroom >> columnedList [
	<gtExample>
	| aList |

	aList := BrColumnedList new.
	aList column
		stencil: [ :aColor :aRowIndex |
			BlTextElement new
				text: (aRowIndex asRopedText);
				padding: (BlInsets all: 12);
				width: 20 ].
	aList column
		stencil: [ :aColor |
			BlTextElement new
				text: (aColor asString asRopedText foreground: aColor contrastingForegroundColor);
				background: aColor;
				padding: (BlInsets all: 12);
				constraintsDo: [ :c | c horizontal matchParent ] ].

	aList display: (Color indexedColors).

	^ aList
]

{ #category : #buttons }
BrExamplesShowroom >> glamorousButton [
	<gtExample>
	
	^ BrButton new
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Button'
]

{ #category : #buttons }
BrExamplesShowroom >> glamorousDisabledButton [
	<gtExample>
	
	^ BrButton new
		look: BrGlamorousButtonWithLabelLook new;
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
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Button 1').
		
	aToolbar addItem: (BrButton new
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Button 2').
	
	aToolbar addItem: (BrButton new
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Button 3').
	
	^ aToolbar
]

{ #category : #toggle }
BrExamplesShowroom >> hydraToggle [
	<gtExample>

	^ BrToggle new
		look: BrHydraSwitchRadioLook new
]

{ #category : #toggle }
BrExamplesShowroom >> hydraWithTrackToggle [
	<gtExample>

	^ BrToggle new
		look: BrHydraSwitchWithTrackLook new
]

{ #category : #toggle }
BrExamplesShowroom >> hydraWithoutTrackToggle [
	<gtExample>

	^ BrToggle new
		look: BrHydraSwitchWithoutTrackLook new
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

{ #category : #toggle }
BrExamplesShowroom >> materialIconAndLabelToggle [
	<gtExample>

	^ BrToggle new
		look: BrMaterialToggleWithIconLook + BrMaterialToggleWithLabelLook
]

{ #category : #toggle }
BrExamplesShowroom >> materialIconToggle [
	<gtExample>

	^ BrToggle new
		look: BrMaterialToggleWithIconLook
]

{ #category : #toggle }
BrExamplesShowroom >> materialLabelToggle [
	<gtExample>

	^ BrToggle new
		look: BrMaterialToggleWithLabelLook
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

{ #category : #toggle }
BrExamplesShowroom >> materialToggle [
	<gtExample>

	^ BrToggle new
		look: BrMaterialToggleWithIconLook + BrMaterialToggleWithLabelLook
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

{ #category : #list }
BrExamplesShowroom >> simpleList [
	<gtExample>
	
	^ BrSimpleList new
		display: (Color indexedColors);
		stencil: [ :aColor |
			BlTextElement new
				text: (aColor asString asRopedText foreground: aColor contrastingForegroundColor);
				background: aColor;
				padding: (BlInsets all: 12);
				constraintsDo: [ :c | c horizontal matchParent ] ]
]
