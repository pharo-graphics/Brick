Class {
	#name : #BrEditorFocusNextShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorFocusNextShortcut >> description [
	^ 'Gives focus to the next focusable element.'
]

{ #category : #initialization }
BrEditorFocusNextShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination arrowRight
]

{ #category : #accessing }
BrEditorFocusNextShortcut >> name [
	^ 'Focus next'
]

{ #category : #evaluation }
BrEditorFocusNextShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrEditorElement
		nextSiblingSuchThat: [ :eachElement | eachElement isFocusable ]
		do: [ :anElement | anElement requestFocus ]
]
