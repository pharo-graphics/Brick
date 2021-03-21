Class {
	#name : #BrEditorSelectLineAfterCursorShortcut,
	#superclass : #BrEditorShortcut,
	#instVars : [
		'combinationForUnix'
	],
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #'api - combination' }
BrEditorSelectLineAfterCursorShortcut >> combinationForUnix [
	^ combinationForUnix
]

{ #category : #accessing }
BrEditorSelectLineAfterCursorShortcut >> description [
	^ 'Extends the selection from the current cursor position to the end of a line.'
]

{ #category : #initialization }
BrEditorSelectLineAfterCursorShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination primaryShiftArrowRight.
	combinationForUnix := BlKeyCombination shiftEnd
]

{ #category : #accessing }
BrEditorSelectLineAfterCursorShortcut >> name [
	^ 'Select to the end of a line'
]

{ #category : #evaluation }
BrEditorSelectLineAfterCursorShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor selecter
		withoutCursorUpdate;
		extendToLineEnd;
		select.

	aBrTextEditor navigator
		moveToLineEnd;
		apply
]
