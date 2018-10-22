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
	#name : #BrGlamorousAccordionLook,
	#superclass : #BrAccordionLook,
	#instVars : [
		'contentContainer',
		'bar',
		'wrapper',
		'headerContainer',
		'headerBar',
		'contentBar',
		'headerTopBorder',
		'contentBottomBorder',
		'rightBorder'
	],
	#category : #'Brick-Glamorous-Accordion'
}

{ #category : #accessing }
BrGlamorousAccordionLook >> borderWidth [
	^ 3
]

{ #category : #accessing }
BrGlamorousAccordionLook >> contentBarWidth [
	^ 5
]

{ #category : #accessing }
BrGlamorousAccordionLook >> headerBarWidth [
	^ 10
]

{ #category : #initialization }
BrGlamorousAccordionLook >> initialize [
	super initialize.

	wrapper := self newWrapper.

	headerBar := self newHeaderBar.
	headerTopBorder := self newHeaderTopBorder.

	contentBar := self newContentBar.
	contentBottomBorder := self newContentBottomBorder.

	rightBorder := self newRightBorder.

	headerContainer := self newHeaderContainer.
	headerContainer addChild: headerBar.

	contentContainer := self newContentContainer.
	contentContainer addChild: contentBar.

	wrapper addChild: headerContainer as: #header.
	wrapper addChild: contentContainer as: #content.
	wrapper addChild: rightBorder.

	self addAll: {
		BrInteractiveLook new style: [ :aStyler |
			aStyler default: [ { headerTopBorder . contentBottomBorder . rightBorder } do: #removeFromParent ].
			aStyler expanded: [
				headerContainer addChild: headerTopBorder.
				contentContainer addChild: contentBottomBorder.
				wrapper addChild: rightBorder
			] ].
	}
]

{ #category : #initialization }
BrGlamorousAccordionLook >> initializeLook [
	"We need to add wrapper first in order for the widget to find header and content containers"
	self widget addChild: wrapper.

	super initializeLook.
	
	self widget
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ]
]

{ #category : #'instance creation' }
BrGlamorousAccordionLook >> newBar [
	<return: #BlElement>

	^ BlElement new
		background: (Color gray alpha: 0.2);
		constraintsDo: [ :c |
			c horizontal exact: 10.
			c vertical matchParent ]
]

{ #category : #'instance creation' }
BrGlamorousAccordionLook >> newContentBar [
	<return: #BlElement>

	^ self newBar
		width: self contentBarWidth;
		margin: (BlInsets left: (self headerBarWidth - self contentBarWidth))
]

{ #category : #'instance creation' }
BrGlamorousAccordionLook >> newContentBottomBorder [
	<return: #BlElement>

	^ BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |
			c ignoreByLayout.
			c ignored vertical alignBottom.
			c vertical fitContent.
			c horizontal matchParent.
			c padding: (BlInsets left: self headerBarWidth) ];
		addChild: (self newBar
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical exact: self borderWidth ])
]

{ #category : #'instance creation' }
BrGlamorousAccordionLook >> newContentContainer [
	<return: #BlElement>

	^ BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ]
]

{ #category : #'instance creation' }
BrGlamorousAccordionLook >> newHeaderBar [
	<return: #BlElement>

	^ self newBar
		width: self headerBarWidth
]

{ #category : #'instance creation' }
BrGlamorousAccordionLook >> newHeaderContainer [
	<return: #BlElement>

	^ BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ]
]

{ #category : #'instance creation' }
BrGlamorousAccordionLook >> newHeaderTopBorder [
	<return: #BlElement>

	^ BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |
			c ignoreByLayout.
			c vertical fitContent.
			c horizontal matchParent.
			c padding: (BlInsets left: self headerBarWidth) ];
		addChild: (self newBar
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical exact: self borderWidth ])
]

{ #category : #'instance creation' }
BrGlamorousAccordionLook >> newRightBorder [
	<return: #BlElement>

	^ BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |
			c ignoreByLayout.
			c ignored horizontal alignRight.
			c vertical matchParent.
			c horizontal fitContent.
			c padding: (BlInsets top: self borderWidth bottom: self borderWidth) ];
		addChild: (self newBar
			constraintsDo: [ :c |
				c vertical matchParent.
				c horizontal exact: self borderWidth ])
]

{ #category : #'instance creation' }
BrGlamorousAccordionLook >> newWrapper [
	<return: #BlElement>

	^ BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ]
]
