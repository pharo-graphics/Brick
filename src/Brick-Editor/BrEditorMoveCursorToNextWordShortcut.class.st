Class {
	#name : #BrEditorMoveCursorToNextWordShortcut,
	#superclass : #BrEditorShortcut,
	#instVars : [
		'combinationForMacOS'
	],
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #'api - combination' }
BrEditorMoveCursorToNextWordShortcut >> combinationForMacOS [
	^ combinationForMacOS
]

{ #category : #accessing }
BrEditorMoveCursorToNextWordShortcut >> description [
	^ 'Moves the cursor to the end of the next (or current) word and deselects any selected text.'
]

{ #category : #initialization }
BrEditorMoveCursorToNextWordShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination builder control arrowRight build.
	combinationForMacOS := BlKeyCombination builder alt arrowRight build.
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
