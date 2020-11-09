Class {
	#name : #BrEditorSelectAllShortcut,
	#superclass : #BrEditorShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #accessing }
BrEditorSelectAllShortcut >> description [
	^ 'Selects all text'
]

{ #category : #initialization }
BrEditorSelectAllShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination primaryA
]

{ #category : #accessing }
BrEditorSelectAllShortcut >> name [
	^ 'Select all'
]

{ #category : #evaluation }
BrEditorSelectAllShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrTextEditor selecter
		all;
		select
]
