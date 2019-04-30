Class {
	#name : #BrGlamorousEditorSpacingLook,
	#superclass : #BrLook,
	#pools : [
		'BrGlamorousColors'
	],
	#category : #'Brick-Glamorous-Editor'
}

{ #category : #'focus handlers' }
BrGlamorousEditorSpacingLook >> blurEvent: anEvent [
	self widgetContent border: (BlBorder paint: EditorBorderColor width: 1)
]

{ #category : #'focus handlers' }
BrGlamorousEditorSpacingLook >> focusEvent: anEvent [
	self widgetContent border: (BlBorder paint: FocusedEditorBorderColor width: 1)
]

{ #category : #'as yet unclassified' }
BrGlamorousEditorSpacingLook >> initialize [
	super initialize.
	changes
		add:
			(#(widgetContent background)
				asBrLookPropertyChangeWithValue: [ Color white ]).
	changes
		add:
			(#(widgetContent border)
				asBrLookPropertyChangeWithValue: [ BlBorder paint: EditorBorderColor width: 1 ])
]

{ #category : #'mouse handlers' }
BrGlamorousEditorSpacingLook >> mouseEnterEvent: anEvent [
	self widget mouseCursor: BlCursor overEditableText
]

{ #category : #'mouse handlers' }
BrGlamorousEditorSpacingLook >> mouseLeaveEvent: anEvent [
	self widget mouseCursor: BlCursor default 
]
