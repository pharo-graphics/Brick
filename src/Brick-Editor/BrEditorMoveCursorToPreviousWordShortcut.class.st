Class {
	#name : #BrEditorMoveCursorToPreviousWordShortcut,
	#superclass : #BrEditorShortcut,
	#instVars : [
		'combinationForMacOS'
	],
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #'api - combination' }
BrEditorMoveCursorToPreviousWordShortcut >> combinationForMacOS [
	^ combinationForMacOS
]

{ #category : #accessing }
BrEditorMoveCursorToPreviousWordShortcut >> description [
	^ 'Moves the cursor to the start of the previous (or current) word and deselects any selected text.'
]

{ #category : #initialization }
BrEditorMoveCursorToPreviousWordShortcut >> initialize [
	super initialize.

	combination := BlKeyCombination builder control arrowLeft build.
	combinationForMacOS := BlKeyCombination builder alt arrowLeft build.
]

{ #category : #accessing }
BrEditorMoveCursorToPreviousWordShortcut >> name [
	^ 'Move cursor to the previous word'
]

{ #category : #evaluation }
BrEditorMoveCursorToPreviousWordShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor deselecter
		all;
		deselect.

	aBrTextEditor navigator
		moveToStartPreviousWord;
		apply
]
