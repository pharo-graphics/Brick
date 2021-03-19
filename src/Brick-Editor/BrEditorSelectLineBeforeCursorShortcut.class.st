Class {
	#name : #BrEditorSelectLineBeforeCursorShortcut,
	#superclass : #BrEditorShortcut,
	#instVars : [
		'combinationForUnix'
	],
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #'api - combination' }
BrEditorSelectLineBeforeCursorShortcut >> combinationForUnix [
	^ combinationForUnix
]

{ #category : #accessing }
BrEditorSelectLineBeforeCursorShortcut >> description [
	^ 'Extends the selection from the current cursor position to the beginning of a line.'
]

{ #category : #initialization }
BrEditorSelectLineBeforeCursorShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination primaryShiftArrowLeft.
	combinationForUnix := BlKeyCombination shiftHome
]

{ #category : #accessing }
BrEditorSelectLineBeforeCursorShortcut >> name [
	^ 'Select to the beginning of a line'
]

{ #category : #evaluation }
BrEditorSelectLineBeforeCursorShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor selecter
		withoutCursorUpdate;
		extendToLineStart;
		select.

	aBrTextEditor navigator
		moveToLineStart;
		apply
]
