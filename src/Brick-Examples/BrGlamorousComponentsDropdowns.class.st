"
!Dropdown
Use Glamorous dropdowns to show a contextual popup associated with a UI element on click.
This can be achieved by adding ${class:BrGlamorousWithDropdownLook}$ look to any visual component, such as ${class:BrButton|label=Button}$
!!!!Dropdown for a button with a label
${example:BrGlamorousComponentsDropdowns>>#buttonWithLabel|previewShow=#gtLiveFor:|previewHeight=66|previewExpanded=true|codeExpanded=false}$
!!!!Dropdown for a button with an icon
${example:BrGlamorousComponentsDropdowns>>#buttonWithIcon|previewShow=#gtLiveFor:|previewHeight=66|previewExpanded=true|codeExpanded=false}$
!!!!Programmatically hide a dropdown
Sometimes it is necessary to hide a dropdown due to some user action, this can be achieved by firing ${class:BrDropdownHideWish}$ wish: 
${example:BrGlamorousComponentsDropdowns>>#hideDropdown|previewShow=#gtLiveFor:|previewHeight=66|previewExpanded=true|codeExpanded=false}$
"
Class {
	#name : #BrGlamorousComponentsDropdowns,
	#superclass : #BrGlamorousComponents,
	#category : #'Brick-Examples-! Glamorous components'
}

{ #category : #button }
BrGlamorousComponentsDropdowns >> buttonWithIcon [
	<gtExample>

	^ BrButton new
		look: BrGlamorousButtonWithIconLook +
			(BrGlamorousWithDropdownLook
				handle: [
					BrButton new
						look: BrGlamorousButtonRectangularLook + BrGlamorousButtonIconLook;
						icon: BrGlamorousIcons menu ]
				content: [
					BlElement new
						background: (Color gray alpha: 0.2);
						size: 100 @ 100;
						margin: (BlInsets all: 10) ]);
		icon: BrGlamorousIcons menu;
		label: 'Click me'
]

{ #category : #button }
BrGlamorousComponentsDropdowns >> buttonWithLabel [
	<gtExample>

	^ BrButton new
		look: BrGlamorousButtonWithLabelLook +
			(BrGlamorousWithDropdownLook
				handle: [
					BrButton new
						look: BrGlamorousButtonRectangularLook + BrGlamorousButtonLabelLook;
						label: 'Click me' ]
				content: [
					BlElement new
						background: (Color gray alpha: 0.2);
						size: 100 @ 100;
						margin: (BlInsets all: 10) ]);
		label: 'Click me'
]

{ #category : #button }
BrGlamorousComponentsDropdowns >> hideDropdown [
	<gtExample>

	^ BrButton new
		look: BrGlamorousButtonWithIconLook +
			(BrGlamorousWithDropdownLook
				handle: [
					BrButton new
						look: BrGlamorousButtonRectangularLook + BrGlamorousButtonIconLook;
						icon: BrGlamorousIcons menu ]
				content: [
					BrButton new
						look: BrGlamorousButtonWithLabelLook;
						margin: (BlInsets all: 20);
						label: 'Close';
						action: [ :aButton | aButton fireEvent: BrDropdownHideWish new ] ]);
		icon: BrGlamorousIcons menu;
		label: 'Click me'
]
