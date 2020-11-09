Class {
	#name : #BrEditorSelectLineAfterCursorShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorSelectLineAfterCursorShortcut >> description [
	^ 'Selects one line at a time below the cursor.'
]

{ #category : #initialization }
BrEditorSelectLineAfterCursorShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination shiftArrowDown
]

{ #category : #accessing }
BrEditorSelectLineAfterCursorShortcut >> name [
	^ 'Select line below'
]

{ #category : #evaluation }
BrEditorSelectLineAfterCursorShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor selecter
		withoutCursorUpdate;
		moveOneDown;
		select.
	aBrTextEditor navigator
		moveDown;
		withoutResettingDesiredCoordinate;
		apply
]
