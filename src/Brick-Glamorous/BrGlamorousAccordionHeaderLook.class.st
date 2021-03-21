Class {
	#name : #BrGlamorousAccordionHeaderLook,
	#superclass : #BrLook,
	#instVars : [
		'labelLook'
	],
	#category : #'Brick-Glamorous-Accordion'
}

{ #category : #initialization }
BrGlamorousAccordionHeaderLook >> initialize [
	super initialize.
	
	self
		addChangeProperty: #(widget layout)
			with: [ BlLinearLayout horizontal ];
		addChangeProperty: #(widget constraints vertical resizer)
			with: [ BlLayoutResizer fitContent ];
		addChangeProperty: #(widget constraints horizontal resizer)
			with: [ BlLayoutResizer matchParent ].
	
	self
		addAll:
			{
			(labelLook := BrGlamorousTextLabelLook new).
			(BrInteractiveLook new
				style: [ :aStyler | 
					aStyler
						default: [ labelLook foreground: BrGlamorousColors defaultHeaderTextColor ].
					aStyler
						disabled: [ labelLook foreground: BrGlamorousColors disabledHeaderTextColor ] ])}.
	self addChangeProperty: #(widget padding) with: [ BlInsets all: 12 ]
]
