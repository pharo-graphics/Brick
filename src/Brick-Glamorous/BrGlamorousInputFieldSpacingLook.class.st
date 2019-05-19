Class {
	#name : #BrGlamorousInputFieldSpacingLook,
	#superclass : #BrGlamorousEditorSpacingLook,
	#category : #'Brick-Glamorous-Editor'
}

{ #category : #initialization }
BrGlamorousInputFieldSpacingLook >> initialize [
	super initialize.
	changes
		add:
			(#(widgetContent constraints vertical resizer)
				asBrLookPropertyChangeWithValue: [ BlLayoutResizer fitContent ]).
	changes
		add:
			(#(widgetContent constraints horizontal resizer)
				asBrLookPropertyChangeWithValue: [ BlLayoutResizer fitContent ]).
	changes
		add:
			(#(widgetContent padding)
				asBrLookPropertyChangeWithValue: [ BlInsets
						top: 5
						left: 5
						bottom: 5
						right: 5 ])
]
