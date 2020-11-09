Class {
	#name : #BrEditorShiftRightShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorShiftRightShortcut >> description [
	^ 'Shift text at the cursor or if there is selection, the selected lines, one indetation to the right.'
]

{ #category : #initialization }
BrEditorShiftRightShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination tab
]

{ #category : #accessing }
BrEditorShiftRightShortcut >> name [
	^ 'Shift right'
]

{ #category : #evaluation }
BrEditorShiftRightShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor selection isEmpty
		ifTrue: [
			aBrTextEditor inserter
				atCursor;
				indentation;
				insert ]
		ifFalse: [
			aBrTextEditor inserter
				indentation;
				beforeSelectedLines;
				withoutSelectionDelete;
				insert ]
]
