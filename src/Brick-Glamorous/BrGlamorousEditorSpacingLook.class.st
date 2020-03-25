Class {
	#name : #BrGlamorousEditorSpacingLook,
	#superclass : #BrLook,
	#category : #'Brick-Glamorous-Editor'
}

{ #category : #'focus handlers' }
BrGlamorousEditorSpacingLook >> blurEvent: anEvent [
	self widgetContent border: (BlBorder paint: BrGlamorousColors editorBorderColor width: 1)
]

{ #category : #'focus handlers' }
BrGlamorousEditorSpacingLook >> focusEvent: anEvent [
	self widgetContent border: (BlBorder paint: BrGlamorousColors focusedEditorBorderColor width: 1)
]

{ #category : #accessing }
BrGlamorousEditorSpacingLook >> initialize [
	super initialize.
	self
		addChangeProperty: #(widgetContent background)
		with: [ Color white ].
	self
		addChangeProperty: #(widgetContent border)
		with: [ BlBorder paint: BrGlamorousColors editorBorderColor width: 1 ]
]

{ #category : #initialization }
BrGlamorousEditorSpacingLook >> initializeListeners [
	super initializeListeners.
	
	self when: BlBlurEvent do: [ :anEvent | self blurEvent: anEvent ].
	self when: BlFocusEvent do: [ :anEvent | self focusEvent: anEvent ]
]
