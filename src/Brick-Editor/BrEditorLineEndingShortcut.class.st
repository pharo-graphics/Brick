Class {
	#name : #BrEditorLineEndingShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorLineEndingShortcut >> description [
	^ 'Inserts a platform specific line ending at the cursor location and indents the new line to match the indentation of the previous line.'
]

{ #category : #initialization }
BrEditorLineEndingShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination return
]

{ #category : #accessing }
BrEditorLineEndingShortcut >> name [
	^ 'Insert line ending'
]

{ #category : #evaluation }
BrEditorLineEndingShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor inserter
		inputFilter: aBrTextEditor inputFilter;
		atCursor;
		lineEndingWithWhitespace;
		insert
]
