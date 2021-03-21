Class {
	#name : #BrEditorSelectLineAboveCursorShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorSelectLineAboveCursorShortcut >> description [
	^ 'Selects one line at a time above the cursor.'
]

{ #category : #initialization }
BrEditorSelectLineAboveCursorShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination shiftArrowUp
]

{ #category : #accessing }
BrEditorSelectLineAboveCursorShortcut >> name [
	^ 'Select line above'
]

{ #category : #evaluation }
BrEditorSelectLineAboveCursorShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor selecter
		withoutCursorUpdate;
		moveOneUp;
		select.
	aBrTextEditor navigator
		moveUp;
		withoutResettingDesiredCoordinate;
		apply
]
