Class {
	#name : #BrEditorLoseFocusShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorLoseFocusShortcut >> description [
	^ 'Loses focus.'
]

{ #category : #initialization }
BrEditorLoseFocusShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination escape
]

{ #category : #accessing }
BrEditorLoseFocusShortcut >> name [
	^ 'Lose focus'
]

{ #category : #evaluation }
BrEditorLoseFocusShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrEditorElement loseFocus
]
