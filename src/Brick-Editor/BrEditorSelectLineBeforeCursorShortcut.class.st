Class {
	#name : #BrEditorSelectLineBeforeCursorShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorSelectLineBeforeCursorShortcut >> description [
	^ 'Selects one line at a time above the cursor.'
]

{ #category : #initialization }
BrEditorSelectLineBeforeCursorShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination shiftArrowUp
]

{ #category : #accessing }
BrEditorSelectLineBeforeCursorShortcut >> name [
	^ 'Select line above'
]

{ #category : #evaluation }
BrEditorSelectLineBeforeCursorShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor selecter
		withoutCursorUpdate;
		moveOneUp;
		select.
	aBrTextEditor navigator
		moveUp;
		withoutResettingDesiredCoordinate;
		apply
]
