"
I define basic layout related properties of material buttons such as padding or resizing strategies
"
Class {
	#name : #BrMaterialButtonLayoutLook,
	#superclass : #BrLook,
	#category : #'Brick-Material-Buttons - Support'
}

{ #category : #'as yet unclassified' }
BrMaterialButtonLayoutLook >> initialize [
	super initialize.
	changes
		add:
			(#(widget layout)
				asBrLookPropertyChangeWithValue: [ BlLinearLayout horizontal alignCenter ]).
	changes
		add:
			(#(widget constraints vertical resizer)
				asBrLookPropertyChangeWithValue: BlLayoutResizer fitContent).
	changes
		add:
			(#(widget constraints horizontal resizer)
				asBrLookPropertyChangeWithValue: BlLayoutResizer fitContent).
	changes
		add:
			(#(widget padding)
				asBrLookPropertyChangeWithValue: [ BlInsets all: 6 ])
]
