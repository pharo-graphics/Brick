"
I am a collection of ""showroom"" examples.

! Buttons

In the example below we show all existing button styles
${example:BrExamplesShowroom class>>#allButtons|expanded|noCode}$

The following glamorous button reacts to various UI interaction events and changes its style according the state (pressed, hovered)
${example:BrExamplesShowroom>>#glamorousButton}$

Button can also be disabled to prevent click events
${example:BrExamplesShowroom>>#glamorousDisabledButton}$

! Toggles

Toggle buttons can have radically different look, while the behaviour of all of them is exactly the same.
${example:BrExamplesShowroom class>>#allToggles|noCode}$

!! Labelled toggle

To create a toggle button with a label user should the corresponding  ${class:BrMaterialToggleWithIconLook}$

${example:BrExamplesShowroom>>#materialLabelToggle}$

!! Iconified toggle

Similarly we can use the icon look to build an iconified toggle:
${example:BrExamplesShowroom>>#materialIconToggle}$

!! Iconified labelled toggle

We can compose label and icon looks to create a toggle button with both label and the icon. Note that the order of looks defines the visual order of the label and icon:

${example:BrExamplesShowroom>>#materialToggle}$

Thus being said by swapping the label and icon look we can move the icon to the right from the label:

${example:BrExamplesShowroom>>#materialReversedToggle}$

! Accordion

Accordion is the exandable and collapsable widget that consists of a header and a content. Any visual ${class:BlElement}$ can be a header of the accordion. The following example shows how a ${class:BrButton}$ can be used an accordion header:

${example:BrExamplesShowroom>>#accordion}$

! Tabs

The following example shows how to create a tab group widget with 3 tabs. The content of each tab is defined with the help of a stencil.

${example:BrExamplesShowroom>>#glamorousTabs}$

! Toolbar

The toolbar is a logical set of action buttons (either labelled or iconified).
${example:BrExamplesShowroom>>#glamorousToolbar}$
${example:BrExamplesShowroom>>#materialToolbar}$

! List

The example below describes how to instantiate a new instance of the simple list that only has one column:
${example:BrExamplesShowroom>>#simpleList|noCode}$

${example:BrExamplesShowroom>>#columnedList|noCode}$











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
			self new glamorousTinyButton.
			self new glamorousSmallButton.
			self new glamorousButton.
			self new glamorousLargeButton.
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

{ #category : #accordion }
BrExamplesShowroom >> accordion [
	<gtExample>
	| accordion |

	accordion := BrAccordion new.
	accordion vExact: 200.
	accordion look: BrGlamorousAccordionLook new.
	accordion content: [ BlElement new background: Color paleRed ].
	accordion header: [
		BrButton new
			look: BrGlamorousAccordionHeaderLook new;
			label: 'Click to expand/collapse';
			action: [ accordion toggleExpanded ] ].
	^ accordion
]

{ #category : #accordion }
BrExamplesShowroom >> accordionList [
	<gtExample>
	
	| children container |
	children := 5 timesCollect: [ :anIndex |
		| accordion |
		accordion := BrAccordion new.
		accordion look: BrGlamorousAccordionLook new.
		accordion margin: (BlInsets all: 5).
		accordion content: [ (BrEditor new text: 'Hello world' asRopedText) ].
		accordion header: [
			BrButton new
				look: BrGlamorousAccordionHeaderLook new;
				label: 'Header ', anIndex asString;
				action: [ accordion toggle ] ].
		accordion ].

	container := BlElement new.
	container layout: BlLinearLayout vertical.
	container padding: (BlInsets all: 10).
	container constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].

	container addChildren: children.
	^ container
]

{ #category : #list }
BrExamplesShowroom >> columnedList [
	<gtExample>
	| aList |
	aList := BrColumnedList new.
	aList column
		width: 50;
		title: 'Index';
		stencil: [ :aColor :aRowIndex | 
			BrLabel new
				look:
					(BrGlamorousLabelLook new
						foreground: aColor contrastingBlackAndWhiteColor);
				text: aRowIndex asString;
				background: aColor;
				padding: (BlInsets all: 12) ].
	aList column
		matchParent;
		title: 'Color';
		stencil: [ :aColor | 
			BrLabel new
				look:
					(BrGlamorousLabelLook new
						foreground: aColor contrastingBlackAndWhiteColor);
				text: aColor asString;
				background: aColor;
				padding: (BlInsets all: 12) ].
	aList items: Color indexedColors.
	^ aList
]

{ #category : #breacrumb }
BrExamplesShowroom >> glamorousBreadcrumb [
	<gtExample>
	<description: 'Breadcrumb with glamorous look'>
	| aBreadcrumb |

	aBreadcrumb := BrBreadcrumb new.
	aBreadcrumb look: (BrGlamorousBreadcrumbLook new separator: [
		BrLabel new
			look: (BrGlamorousLabelLook new thin foreground: Color gray);
			text: '>';
			margin: (BlInsets left: 5 right: 5) ]).

	aBreadcrumb addItem: (BrLabel new
		look: BrGlamorousLabelLook;
		text: 'Home').

	aBreadcrumb addItem: (BrLabel new
		look: BrGlamorousLabelLook;
		text: 'Store').
	
	aBreadcrumb addItem: (BrLabel new
		look: BrGlamorousLabelLook;
		text: 'T-Shirt').
	
	^ aBreadcrumb
]

{ #category : #buttons }
BrExamplesShowroom >> glamorousButton [
	<gtExample>
	
	^ BrButton new
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Button';
		action: [ self inform: 'Clicked' ]
]

{ #category : #buttons }
BrExamplesShowroom >> glamorousButtonWithTooltipLook [
	<gtExample>
	^ BrButton new
		look: BrGlamorousButtonWithIconLook;
		label: 'Accept';
		icon: BrGlamorousVectorIcons accept;
		action: [ self inform: 'Clicked' ]
]

{ #category : #buttons }
BrExamplesShowroom >> glamorousDefaultButton [
	<gtExample>
	
	^ BrButton new
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Button';
		action: [ self inform: 'Clicked' ]
]

{ #category : #buttons }
BrExamplesShowroom >> glamorousDisabledButton [
	<gtExample>
	
	^ self glamorousButton
		disable
]

{ #category : #buttons }
BrExamplesShowroom >> glamorousHugeButton [
	<gtExample>
	^ BrButton new
		beHugeSize;
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Button';
		action: [ self inform: 'Clicked' ]
]

{ #category : #buttons }
BrExamplesShowroom >> glamorousLargeButton [
	<gtExample>
	^ BrButton new
		beLargeSize;
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Button';
		action: [ self inform: 'Clicked' ]
]

{ #category : #buttons }
BrExamplesShowroom >> glamorousSmallButton [
	<gtExample>
	
	^ BrButton new
		beSmallSize;
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Button';
		action: [ self inform: 'Clicked' ]
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
				c vertical exact: 150 ];
			margin: (BlInsets all: 10);
			background: (Color red alpha: 0.2) ]).

	aTabGroup addTab: (BrTab new
		look: BrGlamorousTabLook new;
		label: 'Tab 2';
		stencil: [ BlElement new
			margin: (BlInsets all: 10);
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical exact: 50 ];
			background: (Color blue alpha: 0.2) ]).

	aTabGroup addTab: (BrTab new
		look: BrGlamorousTabLook new;
		label: 'Tab 3';
		stencil: [ BlElement new
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical exact: 100 ];
			margin: (BlInsets all: 10);
			background: (Color orange alpha: 0.2) ]).

	^ aTabGroup
]

{ #category : #tabs }
BrExamplesShowroom >> glamorousTabsSwitcherWithHiddenSelectedTabsWithIcons [
	<gtExample>
	<description: 'Tabs with glamorous switcher look'>
	| aTabGroup |

	aTabGroup := BrTabGroup new.
	aTabGroup look: BrGlamorousTabGroupSwitcherWithHiddenSelectedTabLook new.

	aTabGroup addTab: (BrTab new
		look: BrGlamorousTabSwitcherWithIconLook new;
		label: 'Tab 1';
		icon: BrGlamorousVectorIcons add;
		stencil: [ BlElement new
			constraintsDo: [ :c |
				c horizontal exact: 300.
				c vertical matchParent ];
			margin: (BlInsets all: 10);
			background: (Color red alpha: 0.2) ]).

	aTabGroup addTab: (BrTab new
		look: BrGlamorousTabSwitcherWithIconLook new;
		label: 'Tab 2';
		icon: BrGlamorousVectorIcons remove;
		stencil: [ BlElement new
			margin: (BlInsets all: 10);
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical matchParent ];
			background: (Color blue alpha: 0.2) ]).
	
	^ aTabGroup
]

{ #category : #tabs }
BrExamplesShowroom >> glamorousTabsSwitcherWithHiddenSelectedTabsWithLabels [
	<gtExample>
	<description: 'Tabs with glamorous switcher look'>
	| aTabGroup |

	aTabGroup := BrTabGroup new.
	aTabGroup look: BrGlamorousTabGroupSwitcherWithHiddenSelectedTabLook new.

	aTabGroup addTab: (BrTab new
		look: BrGlamorousTabSwitcherWithLabelLook new;
		label: 'Tab 1';
		stencil: [ BlElement new
			constraintsDo: [ :c |
				c horizontal exact: 300.
				c vertical matchParent ];
			margin: (BlInsets all: 10);
			background: (Color red alpha: 0.2) ]).

	aTabGroup addTab: (BrTab new
		look: BrGlamorousTabSwitcherWithLabelLook new;
		label: 'Tab 2';
		stencil: [ BlElement new
			margin: (BlInsets all: 10);
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical matchParent ];
			background: (Color blue alpha: 0.2) ]).
	
	^ aTabGroup
]

{ #category : #tabs }
BrExamplesShowroom >> glamorousTabsSwitcherWithIcons [
	<gtExample>
	<description: 'Tabs with glamorous switcher look'>
	| aTabGroup |

	aTabGroup := BrTabGroup new.
	aTabGroup look: BrGlamorousTabGroupSwitcherLook new.

	aTabGroup addTab: (BrTab new
		look: BrGlamorousTabSwitcherWithIconLook new;
		label: 'Tab 1';
		icon: BrGlamorousVectorIcons add;
		stencil: [ BlElement new
			constraintsDo: [ :c |
				c horizontal exact: 300.
				c vertical matchParent ];
			margin: (BlInsets all: 10);
			background: (Color red alpha: 0.2) ]).

	aTabGroup addTab: (BrTab new
		look: BrGlamorousTabSwitcherWithIconLook new;
		label: 'Tab 2';
		icon: BrGlamorousVectorIcons remove;
		stencil: [ BlElement new
			margin: (BlInsets all: 10);
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical matchParent ];
			background: (Color blue alpha: 0.2) ]).
	
	^ aTabGroup
]

{ #category : #tabs }
BrExamplesShowroom >> glamorousTabsSwitcherWithLabels [
	<gtExample>
	<description: 'Tabs with glamorous switcher look'>
	| aTabGroup |

	aTabGroup := BrTabGroup new.
	aTabGroup look: BrGlamorousTabGroupSwitcherLook new.

	aTabGroup addTab: (BrTab new
		look: BrGlamorousTabSwitcherWithLabelLook new;
		label: 'Tab 1';
		stencil: [ BlElement new
			constraintsDo: [ :c |
				c horizontal exact: 300.
				c vertical matchParent ];
			margin: (BlInsets all: 10);
			background: (Color red alpha: 0.2) ]).

	aTabGroup addTab: (BrTab new
		look: BrGlamorousTabSwitcherWithLabelLook new;
		label: 'Tab 2';
		stencil: [ BlElement new
			margin: (BlInsets all: 10);
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical matchParent ];
			background: (Color blue alpha: 0.2) ]).
	
	^ aTabGroup
]

{ #category : #buttons }
BrExamplesShowroom >> glamorousTinyButton [
	<gtExample>
	^ BrButton new
		beTinySize;
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Button';
		action: [ self inform: 'Clicked' ]
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
		look: BrGlamorousButtonWithIconLook new;
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

{ #category : #toggle }
BrExamplesShowroom >> materialReversedToggle [
	<gtExample>

	^ BrToggle new
		look: BrMaterialToggleWithLabelLook + BrMaterialToggleWithIconLook
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
		items: Color indexedColors;
		stencil: [ :aColor | 
			BrLabel new
				look:
					(BrGlamorousLabelLook new
						foreground: aColor contrastingBlackAndWhiteColor);
				text: aColor asString;
				background: aColor;
				padding: (BlInsets all: 12);
				hMatchParent ]
]
