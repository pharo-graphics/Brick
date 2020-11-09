Class {
	#name : #BrEditorSelectLetterAfterCursorShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorSelectLetterAfterCursorShortcut >> description [
	^ 'Selects one letter at a time to the right from the cursor.'
]

{ #category : #initialization }
BrEditorSelectLetterAfterCursorShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination shiftArrowRight
]

{ #category : #accessing }
BrEditorSelectLetterAfterCursorShortcut >> name [
	^ 'Select letter to the right'
]

{ #category : #evaluation }
BrEditorSelectLetterAfterCursorShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor selecter
		withoutCursorUpdate;
		moveOneToRight;
		select.
	aBrTextEditor navigator
		moveRight;
		apply
]
