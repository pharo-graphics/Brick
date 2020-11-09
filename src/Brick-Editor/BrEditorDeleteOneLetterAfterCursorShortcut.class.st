Class {
	#name : #BrEditorDeleteOneLetterAfterCursorShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorDeleteOneLetterAfterCursorShortcut >> description [
	^ 'Discards the character ahead of the cursor''s position, moving all following characters one position "back" towards the freed letterspace.'
]

{ #category : #initialization }
BrEditorDeleteOneLetterAfterCursorShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination delete
]

{ #category : #accessing }
BrEditorDeleteOneLetterAfterCursorShortcut >> name [
	^ 'Forward delete'
]

{ #category : #evaluation }
BrEditorDeleteOneLetterAfterCursorShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor deleter
		selected;
		oneAfterCursor;
		delete
]
