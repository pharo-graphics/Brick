Class {
	#name : #BrEditorUndoShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorUndoShortcut >> description [
	^ 'Erases the last change done to the document, reverting it to an older state.'
]

{ #category : #initialization }
BrEditorUndoShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination primaryZ
]

{ #category : #accessing }
BrEditorUndoShortcut >> name [
	^ 'Undo'
]

{ #category : #evaluation }
BrEditorUndoShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor undo
]
