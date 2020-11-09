Class {
	#name : #BrEditorPasteShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorPasteShortcut >> description [
	^ 'Paste a text from the clipboard at the current cursor position and delete any currently selected text.'
]

{ #category : #initialization }
BrEditorPasteShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination primaryV
]

{ #category : #accessing }
BrEditorPasteShortcut >> name [
	^ 'Paste'
]

{ #category : #evaluation }
BrEditorPasteShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor paster
		inputFilter: aBrTextEditor inputFilter;
		fromClipboard;
		atCursor;
		paste
]
