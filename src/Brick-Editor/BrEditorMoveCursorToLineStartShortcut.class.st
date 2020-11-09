Class {
	#name : #BrEditorMoveCursorToLineStartShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorMoveCursorToLineStartShortcut >> description [
	^ 'Moves the cursor to the start of the current line and deselects any selected text.'
]

{ #category : #initialization }
BrEditorMoveCursorToLineStartShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination home
]

{ #category : #accessing }
BrEditorMoveCursorToLineStartShortcut >> name [
	^ 'Move cursor to the line start'
]

{ #category : #evaluation }
BrEditorMoveCursorToLineStartShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor deselecter
		all;
		deselect.
	aBrTextEditor navigator
		moveToLineStart;
		apply
]
