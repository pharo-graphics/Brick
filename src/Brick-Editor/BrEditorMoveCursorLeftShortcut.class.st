Class {
	#name : #BrEditorMoveCursorLeftShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorMoveCursorLeftShortcut >> description [
	^ 'Moves the cursor one letter at a time to the left from the current position and deselects any selected text.'
]

{ #category : #initialization }
BrEditorMoveCursorLeftShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination arrowLeft
]

{ #category : #accessing }
BrEditorMoveCursorLeftShortcut >> name [
	^ 'Move cursor left'
]

{ #category : #evaluation }
BrEditorMoveCursorLeftShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor deselecter
		all;
		deselect.
	aBrTextEditor navigator
		moveLeft;
		apply
]
