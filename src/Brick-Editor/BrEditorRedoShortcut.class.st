Class {
	#name : #BrEditorRedoShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorRedoShortcut >> description [
	^ 'Reverses the undo or advances the document to a more recent state.'
]

{ #category : #initialization }
BrEditorRedoShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination primaryShiftZ
]

{ #category : #accessing }
BrEditorRedoShortcut >> name [
	^ 'Redo'
]

{ #category : #evaluation }
BrEditorRedoShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor redo
]
