Class {
	#name : #BrGlamorousEditorSpacingAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Glamorous-Editor'
}

{ #category : #'focus handlers' }
BrGlamorousEditorSpacingAptitude >> blurEvent: anEvent [
	self widgetContent border: (BlBorder paint: BrGlamorousColors editorBorderColor width: 1)
]

{ #category : #'focus handlers' }
BrGlamorousEditorSpacingAptitude >> focusEvent: anEvent [
	self widgetContent border: (BlBorder paint: BrGlamorousColors focusedEditorBorderColor width: 1)
]

{ #category : #accessing }
BrGlamorousEditorSpacingAptitude >> initialize [
	super initialize.
	self
		addChangeProperty: #(widgetContent background)
		with: [ Color white ].
	self
		addChangeProperty: #(widgetContent border)
		with: [ BlBorder paint: BrGlamorousColors editorBorderColor width: 1 ]
]

{ #category : #initialization }
BrGlamorousEditorSpacingAptitude >> initializeListeners [
	super initializeListeners.
	
	self when: BlBlurEvent do: [ :anEvent | self blurEvent: anEvent ].
	self when: BlFocusEvent do: [ :anEvent | self focusEvent: anEvent ]
]
