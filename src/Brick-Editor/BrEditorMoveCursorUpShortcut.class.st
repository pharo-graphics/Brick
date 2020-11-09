Class {
	#name : #BrEditorMoveCursorUpShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorMoveCursorUpShortcut >> description [
	^ 'Moves the cursor one line at a time above the current position and deselects any selected text.'
]

{ #category : #initialization }
BrEditorMoveCursorUpShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination arrowUp
]

{ #category : #accessing }
BrEditorMoveCursorUpShortcut >> name [
	^ 'Move cursor up'
]

{ #category : #evaluation }
BrEditorMoveCursorUpShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor deselecter
		all;
		deselect.
	aBrTextEditor navigator
		moveUp;
		withoutResettingDesiredCoordinate;
		apply
]
