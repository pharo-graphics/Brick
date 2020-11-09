Class {
	#name : #BrEditorDeselectAllShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorDeselectAllShortcut >> description [
	^ 'Deselects any currently selected text.'
]

{ #category : #initialization }
BrEditorDeselectAllShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination escape
]

{ #category : #accessing }
BrEditorDeselectAllShortcut >> name [
	^ 'Deselect'
]

{ #category : #evaluation }
BrEditorDeselectAllShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor selectNone
]
