Class {
	#name : #BrEditorCutShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorCutShortcut >> description [
	^ 'Cut selected text and save it to the clipboard ready to paste elsewhere.'
]

{ #category : #initialization }
BrEditorCutShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination primaryX
]

{ #category : #initialization }
BrEditorCutShortcut >> name [
	^ 'Cut'
]

{ #category : #evaluation }
BrEditorCutShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor cutSelected
]
