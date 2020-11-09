Class {
	#name : #BrEditorCopyShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorCopyShortcut >> description [
	^ 'Copies the selection text into the clipboard.'
]

{ #category : #initialization }
BrEditorCopyShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination primaryC
]

{ #category : #accessing }
BrEditorCopyShortcut >> name [
	^ 'Copy'
]

{ #category : #evaluation }
BrEditorCopyShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor copySelected
]
