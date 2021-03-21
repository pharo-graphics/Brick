Class {
	#name : #BrEditableLabelCancelShortcut,
	#superclass : #BrEditableLabelShortcut,
	#category : #'Brick-Editor - Shortcuts'
}

{ #category : #accessing }
BrEditableLabelCancelShortcut >> description [
	^ 'Cancels changes and brings back the state of the editor.'
]

{ #category : #initialization }
BrEditableLabelCancelShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination escape
]

{ #category : #accessing }
BrEditableLabelCancelShortcut >> name [
	^ 'Cancel'
]

{ #category : #evaluation }
BrEditableLabelCancelShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrEditorElement cancelEdition
]
