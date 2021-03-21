Class {
	#name : #BrEditorCarriageReturnShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorCarriageReturnShortcut >> description [
	^ 'Inserts a carriage return (cr) at the cursor location and indents the new line to match the indentation of the previous line.'
]

{ #category : #initialization }
BrEditorCarriageReturnShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination return
]

{ #category : #accessing }
BrEditorCarriageReturnShortcut >> name [
	^ 'Insert carriage return'
]

{ #category : #evaluation }
BrEditorCarriageReturnShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor inserter
		inputFilter: aBrTextEditor inputFilter;
		atCursor;
		crLineEndingWithWhitespace;
		insert
]
