Class {
	#name : #BrEditorMoveCursorToNextWordShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorMoveCursorToNextWordShortcut >> description [
	^ 'Moves the cursor to the end of the next (or current) word and deselects any selected text.'
]

{ #category : #initialization }
BrEditorMoveCursorToNextWordShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination primaryArrowRight
]

{ #category : #accessing }
BrEditorMoveCursorToNextWordShortcut >> name [
	^ 'Move cursor to the next word'
]

{ #category : #evaluation }
BrEditorMoveCursorToNextWordShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor deselecter
		all;
		deselect.
	aBrTextEditor navigator
		moveToEndNextWord;
		apply
]
