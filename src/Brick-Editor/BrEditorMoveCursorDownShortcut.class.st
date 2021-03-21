Class {
	#name : #BrEditorMoveCursorDownShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorMoveCursorDownShortcut >> description [
	^ 'Moves the cursor one line at a time below the current position and deselects any selected text.'
]

{ #category : #initialization }
BrEditorMoveCursorDownShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination arrowDown
]

{ #category : #accessing }
BrEditorMoveCursorDownShortcut >> name [
	^ 'Move cursor down'
]

{ #category : #evaluation }
BrEditorMoveCursorDownShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor deselecter
		all;
		deselect.
	aBrTextEditor navigator
		moveDown;
		withoutResettingDesiredCoordinate;
		apply
]
