Class {
	#name : #BrGlamorousAccordionWithBorderLook,
	#superclass : #BrGlamorousAccordionLook,
	#instVars : [
		'headerTopBorder',
		'contentBottomBorder',
		'rightBorder'
	],
	#category : #'Brick-Glamorous-Accordion'
}

{ #category : #accessing }
BrGlamorousAccordionWithBorderLook >> borderWidth [
	^ 3
]

{ #category : #initialization }
BrGlamorousAccordionWithBorderLook >> initialize [
	super initialize.

	headerTopBorder := self newHeaderTopBorder.
	contentBottomBorder := self newContentBottomBorder.
	rightBorder := self newRightBorder.

	self addAll: {
		BrInteractiveLook new style: [ :aStyler |
			aStyler default: [ { headerTopBorder . contentBottomBorder . rightBorder } do: #removeFromParent ].
			aStyler expanded: [
				headerContainer addChild: headerTopBorder.
				contentContainer addChild: contentBottomBorder.
				wrapper addChild: rightBorder
			] ] }
]

{ #category : #'instance creation' }
BrGlamorousAccordionWithBorderLook >> newContentBottomBorder [
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
BrGlamorousAccordionWithBorderLook >> newHeaderTopBorder [
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
BrGlamorousAccordionWithBorderLook >> newRightBorder [
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
