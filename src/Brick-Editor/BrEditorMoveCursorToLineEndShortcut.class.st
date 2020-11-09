Class {
	#name : #BrEditorMoveCursorToLineEndShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorMoveCursorToLineEndShortcut >> description [
	^ 'Moves the cursor to the end of the current line and deselects any selected text.'
]

{ #category : #initialization }
BrEditorMoveCursorToLineEndShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination end
]

{ #category : #accessing }
BrEditorMoveCursorToLineEndShortcut >> name [
	^ 'Move cursor to the line end'
]

{ #category : #evaluation }
BrEditorMoveCursorToLineEndShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor deselecter
		all;
		deselect.
	aBrTextEditor navigator
		moveToLineEnd;
		apply
]
