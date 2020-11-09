Class {
	#name : #BrEditableLabelAcceptShortcut,
	#superclass : #BrEditableLabelShortcut,
	#category : #'Brick-Editor - Shortcuts'
}

{ #category : #accessing }
BrEditableLabelAcceptShortcut >> description [
	^ 'Accepts changes make to the text.'
]

{ #category : #initialization }
BrEditableLabelAcceptShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination return
]

{ #category : #accessing }
BrEditableLabelAcceptShortcut >> name [
	^ 'Accept'
]

{ #category : #evaluation }
BrEditableLabelAcceptShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrEditorElement acceptEdition
]
