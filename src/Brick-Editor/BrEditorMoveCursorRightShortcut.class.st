Class {
	#name : #BrEditorMoveCursorRightShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorMoveCursorRightShortcut >> description [
	^ 'Moves the cursor one letter at a time to the right from the current position and deselects any selected text.'
]

{ #category : #initialization }
BrEditorMoveCursorRightShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination arrowRight
]

{ #category : #accessing }
BrEditorMoveCursorRightShortcut >> name [
	^ 'Move cursor right'
]

{ #category : #evaluation }
BrEditorMoveCursorRightShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor deselecter
		all;
		deselect.
	aBrTextEditor navigator
		moveRight;
		apply
]
