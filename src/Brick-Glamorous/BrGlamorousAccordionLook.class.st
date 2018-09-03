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
		'contentContainer'
	],
	#category : #'Brick-Glamorous-Accordion'
}

{ #category : #initialization }
BrGlamorousAccordionLook >> initialize [
	super initialize.

	contentContainer := BlElement new.
	contentContainer layout: BlLinearLayout new.
	contentContainer background: Color white.
	contentContainer constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].
	contentContainer margin: (BlInsets all: 2).
	
	self addAll: {
		BrLayoutLook linearVertical vFitContent hMatchParent.
		BrInteractiveLook new style: [ :aStyler |
			aStyler default: [ :aWidget | aWidget background: BrGlamorousColors lightBorderColor ].
			aStyler focused: [ :aWidget | aWidget background: BrGlamorousColors primaryBorderColor ] ].
	}
]

{ #category : #initialization }
BrGlamorousAccordionLook >> initializeLook [
	super initializeLook.
	
	self widget addChild: contentContainer as: #content
]
