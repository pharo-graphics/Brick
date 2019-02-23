Class {
	#name : #BrGlamorousEditorLook,
	#superclass : #BrEditorLook,
	#pools : [
		'BrGlamorousColors'
	],
	#category : #'Brick-Glamorous-Editor'
}

{ #category : #'focus handlers' }
BrGlamorousEditorLook >> blurEvent: anEvent [
	self widgetContent border: (BlBorder paint: EditorBorderColor width: 1)
]

{ #category : #'focus handlers' }
BrGlamorousEditorLook >> focusEvent: anEvent [
	self widgetContent border: (BlBorder paint: FocusedEditorBorderColor width: 1)
]

{ #category : #initialization }
BrGlamorousEditorLook >> initialize [
	super initialize.

	self
		fontName: 'Source Sans Pro';
		fontSize: 15;
		foreground: (Color r: 36 g: 41 b: 46 range: 255);
		spacing: 0.4
]

{ #category : #initialization }
BrGlamorousEditorLook >> initializeLook [
	super initializeLook.
	
	self widgetContent
		background: Color white;
		border: (BlBorder paint: EditorBorderColor width: 1)
]

{ #category : #'mouse handlers' }
BrGlamorousEditorLook >> mouseEnterEvent: anEvent [
	self widget mouseCursor: BlCursor overEditableText
]

{ #category : #'mouse handlers' }
BrGlamorousEditorLook >> mouseLeaveEvent: anEvent [
	self widget mouseCursor: BlCursor default 
]
