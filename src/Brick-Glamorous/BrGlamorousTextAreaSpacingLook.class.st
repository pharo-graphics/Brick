Class {
	#name : #BrGlamorousTextAreaSpacingLook,
	#superclass : #BrGlamorousEditorSpacingLook,
	#category : #'Brick-Glamorous-Editor'
}

{ #category : #initialization }
BrGlamorousTextAreaSpacingLook >> initialize [
	super initialize.
	self
		addChangeProperty: #(widget constraints vertical resizer)
		with: BlLayoutResizer fitContent.
	self
		addChangeProperty: #(widget constraints horizontal resizer)
		with: BlLayoutResizer matchParent.
	self
		addChangeProperty: #(widget padding)
		with: [ BlInsets
				top: 10
				left: 5
				bottom: 10
				right: 5 ]
]
