"
accordion := BrAccordion new.
accordion look: BrGlamorousAccordionLook new.
accordion stencil: [
	BlElement new
		size: 200@200;
		background: Color random ].

header := BrButton new.
header look: BrGlamorousAccordionHeaderLook new.
header label: 'Header'.
header action: [ accordion toggle ].

accordion addChildFirst: header.
accordion.
"
Class {
	#name : #BrGlamorousAccordionAptitude,
	#superclass : #BrAccordionAptitude,
	#instVars : [
		'contentContainer',
		'bar',
		'wrapper',
		'headerContainer',
		'headerBar',
		'contentBar'
	],
	#category : #'Brick-Glamorous-Accordion'
}

{ #category : #accessing }
BrGlamorousAccordionAptitude >> contentBarWidth [
	^ 10
]

{ #category : #accessing }
BrGlamorousAccordionAptitude >> headerBar [
	<return: #BlElement>

	^ headerBar
]

{ #category : #accessing }
BrGlamorousAccordionAptitude >> headerBarWidth [
	^ 10
]

{ #category : #initialization }
BrGlamorousAccordionAptitude >> initialize [
	super initialize.

	wrapper := self newWrapper.
	headerBar := self newHeaderBar.
	contentBar := self newContentBar.
	headerContainer := self newHeaderContainer.
	headerContainer addChild: headerBar.
	contentContainer := self newContentContainer.
	contentContainer addChild: contentBar.

	wrapper addChild: headerContainer as: #header.
	wrapper addChild: contentContainer as: #content.
	
	self
		addChangeProperty: #(widget layout)
		with: [ BlLinearLayout horizontal ].
	self addChangeAddChildAs: #(content wrapper) with: [ wrapper ].
	
	self add: (BrStyleCommonAptitude new
		@ headerBar;
		default: [ :aStyle | aStyle background: (Color gray alpha: 0.4) ];
		focused: [ :aStyle | aStyle background: (BrGlamorousColors primaryBorderColor alpha: 0.4) ]).
		
	self add: (BrStyleCommonAptitude new
		@ contentBar;
		default: [ :aStyle | aStyle gone; background: (Color gray alpha: 0.2) ];
		focused: [ :aStyle | aStyle background: (BrGlamorousColors primaryBorderColor alpha: 0.2) ];
		expanded: [ :aStyle | aStyle visible ]).
	
	self add: (BrLayoutResizerAptitude new
		inherit;
		inherit: wrapper;
		inherit: contentContainer).
	
	self
		add:
			(BrLayoutResizerAptitude new
				inherit: [ :aBlock | aBlock value: (contentElement ifNil: [ BlElement new ]) ])
]

{ #category : #'instance creation' }
BrGlamorousAccordionAptitude >> newBar [
	<return: #BlElement>

	^ BlElement new
		background: (Color gray alpha: 0.2);
		constraintsDo: [ :c |
			c horizontal exact: 10.
			c vertical matchParent ]
]

{ #category : #'instance creation' }
BrGlamorousAccordionAptitude >> newContentBar [
	<return: #BlElement>

	^ self newBar
		width: self contentBarWidth;
		margin: (BlInsets left: (self headerBarWidth - self contentBarWidth))
]

{ #category : #'instance creation' }
BrGlamorousAccordionAptitude >> newContentContainer [
	<return: #BlElement>

	^ BlElement new layout: BlLinearLayout horizontal
]

{ #category : #'instance creation' }
BrGlamorousAccordionAptitude >> newHeaderBar [
	<return: #BlElement>

	^ self newBar
		width: self headerBarWidth
]

{ #category : #'instance creation' }
BrGlamorousAccordionAptitude >> newHeaderContainer [
	<return: #BlElement>

	^ BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ]
]

{ #category : #'instance creation' }
BrGlamorousAccordionAptitude >> newWrapper [
	<return: #BlElement>

	^ BlElement new layout: BlLinearLayout vertical
]
