Class {
	#name : #BrEditorSelectLetterBeforeCursorShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorSelectLetterBeforeCursorShortcut >> description [
	^ 'Selects one letter at a time to the left from the cursor.'
]

{ #category : #initialization }
BrEditorSelectLetterBeforeCursorShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination shiftArrowLeft
]

{ #category : #accessing }
BrEditorSelectLetterBeforeCursorShortcut >> name [
	^ 'Select letter to the left'
]

{ #category : #evaluation }
BrEditorSelectLetterBeforeCursorShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor selecter
		withoutCursorUpdate;
		moveOneToLeft;
		select.
	aBrTextEditor navigator
		moveLeft;
		apply
]
