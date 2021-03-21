Class {
	#name : #BrGlamorousInputFieldSpacingLook,
	#superclass : #BrGlamorousEditorSpacingLook,
	#category : #'Brick-Glamorous-Editor'
}

{ #category : #initialization }
BrGlamorousInputFieldSpacingLook >> initialize [
	super initialize.
	self
		addChangeProperty: #(widgetContent constraints vertical resizer)
		with: [ BlLayoutResizer fitContent ].
	self
		addChangeProperty: #(widgetContent constraints horizontal resizer)
		with: [ BlLayoutResizer fitContent ].
	self
		addChangeProperty: #(widgetContent padding)
		with: [ BlInsets
				top: 5
				left: 5
				bottom: 5
				right: 5 ]
]
