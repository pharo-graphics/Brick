Class {
	#name : #BrEditorDeleteOneLetterBeforeCursorShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorDeleteOneLetterBeforeCursorShortcut >> description [
	^ 'Moves the display cursor one position backwards, deletes the character at that position, and shifts back the text after that position by one position.'
]

{ #category : #initialization }
BrEditorDeleteOneLetterBeforeCursorShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination backspace
]

{ #category : #accessing }
BrEditorDeleteOneLetterBeforeCursorShortcut >> name [
	^ 'Delete'
]

{ #category : #evaluation }
BrEditorDeleteOneLetterBeforeCursorShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor deleter
		selected;
		oneBeforeCursor;
		surroundings: aBrTextEditor surroundMap;
		delete
]
