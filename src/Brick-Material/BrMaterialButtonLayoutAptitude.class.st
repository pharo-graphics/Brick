"
I define basic layout related properties of material buttons such as padding or resizing strategies
"
Class {
	#name : #BrMaterialButtonLayoutAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Material-Buttons - Support'
}

{ #category : #accessing }
BrMaterialButtonLayoutAptitude >> initialize [
	super initialize.
	self
		addChangeProperty: #(widget layout)
		with: [ BlLinearLayout horizontal alignCenter ].
	self
		addChangeProperty: #(widget constraints vertical resizer)
		with: BlLayoutResizer fitContent.
	self
		addChangeProperty: #(widget constraints horizontal resizer)
		with: BlLayoutResizer fitContent.
	self addChangeProperty: #(widget padding) with: [ BlInsets all: 6 ]
]
