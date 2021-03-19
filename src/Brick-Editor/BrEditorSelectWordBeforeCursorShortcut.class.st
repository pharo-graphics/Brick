Class {
	#name : #BrEditorSelectWordBeforeCursorShortcut,
	#superclass : #BrEditorShortcut,
	#instVars : [
		'combinationForMacOS'
	],
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #'api - combination' }
BrEditorSelectWordBeforeCursorShortcut >> combinationForMacOS [
	^ combinationForMacOS
]

{ #category : #accessing }
BrEditorSelectWordBeforeCursorShortcut >> description [
	^ 'Extends the selection from the current cursor position to the beginning of previous word.'
]

{ #category : #initialization }
BrEditorSelectWordBeforeCursorShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination builder shift control arrowLeft build.
	combinationForMacOS := BlKeyCombination builder shift alt arrowLeft build.
]

{ #category : #accessing }
BrEditorSelectWordBeforeCursorShortcut >> name [
	^ 'Select previous word'
]

{ #category : #evaluation }
BrEditorSelectWordBeforeCursorShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor selecter
		withoutCursorUpdate;
		extendToPreviousWordStart;
		select.

	aBrTextEditor navigator
		moveToStartPreviousWord;
		apply
]
