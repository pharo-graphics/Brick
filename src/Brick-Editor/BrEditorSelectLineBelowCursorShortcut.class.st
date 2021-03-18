Class {
	#name : #BrEditorSelectLineBelowCursorShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorSelectLineBelowCursorShortcut >> description [
	^ 'Selects one line at a time below the cursor.'
]

{ #category : #initialization }
BrEditorSelectLineBelowCursorShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination shiftArrowDown
]

{ #category : #accessing }
BrEditorSelectLineBelowCursorShortcut >> name [
	^ 'Select line below'
]

{ #category : #evaluation }
BrEditorSelectLineBelowCursorShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor selecter
		withoutCursorUpdate;
		moveOneDown;
		select.
	aBrTextEditor navigator
		moveDown;
		withoutResettingDesiredCoordinate;
		apply
]
