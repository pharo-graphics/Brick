Class {
	#name : #BrGlamorousTextAreaSpacingLook,
	#superclass : #BrGlamorousEditorSpacingLook,
	#category : #'Brick-Glamorous-Editor'
}

{ #category : #initialization }
BrGlamorousTextAreaSpacingLook >> initialize [
	super initialize.
	changes
		add:
			(#(widget constraints vertical resizer)
				asBrLookPropertyChangeWithValue: BlLayoutResizer fitContent).
	changes
		add:
			(#(widget constraints horizontal resizer)
				asBrLookPropertyChangeWithValue: BlLayoutResizer matchParent).
	changes
		add:
			(#(widget padding)
				asBrLookPropertyChangeWithValue: [ BlInsets
						top: 10
						left: 5
						bottom: 10
						right: 5 ])
]
