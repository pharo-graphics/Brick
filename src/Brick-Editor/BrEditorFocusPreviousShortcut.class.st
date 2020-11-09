Class {
	#name : #BrEditorFocusPreviousShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorFocusPreviousShortcut >> description [
	^ 'Gives focus to the previous focusable element.'
]

{ #category : #initialization }
BrEditorFocusPreviousShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination arrowLeft
]

{ #category : #accessing }
BrEditorFocusPreviousShortcut >> name [
	^ 'Focus previous'
]

{ #category : #evaluation }
BrEditorFocusPreviousShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrEditorElement
		previousSiblingSuchThat: [ :eachElement | eachElement isFocusable ]
		do: [ :anElement | anElement requestFocus ]
]
