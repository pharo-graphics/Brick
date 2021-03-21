Class {
	#name : #BrEditorSelectWordAfterCursorShortcut,
	#superclass : #BrEditorShortcut,
	#instVars : [
		'combinationForMacOS'
	],
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #'api - combination' }
BrEditorSelectWordAfterCursorShortcut >> combinationForMacOS [
	^ combinationForMacOS
]

{ #category : #accessing }
BrEditorSelectWordAfterCursorShortcut >> description [
	^ 'Extends the selection from the current cursor position to the end of the next word.'
]

{ #category : #initialization }
BrEditorSelectWordAfterCursorShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination builder shift control arrowRight build.
	combinationForMacOS := BlKeyCombination builder shift alt arrowRight build.
]

{ #category : #accessing }
BrEditorSelectWordAfterCursorShortcut >> name [
	^ 'Select next word'
]

{ #category : #evaluation }
BrEditorSelectWordAfterCursorShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor selecter
		withoutCursorUpdate;
		extendToNextWordEnd;
		select.

	aBrTextEditor navigator
		moveToEndNextWord;
		apply
]
