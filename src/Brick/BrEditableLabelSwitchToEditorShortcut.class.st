Class {
	#name : #BrEditableLabelSwitchToEditorShortcut,
	#superclass : #BrEditableLabelShortcut,
	#category : #'Brick-Editor - Shortcuts'
}

{ #category : #accessing }
BrEditableLabelSwitchToEditorShortcut >> description [
	^ 'Switches the label into an editor allowing users to edit it.'
]

{ #category : #initialization }
BrEditableLabelSwitchToEditorShortcut >> initialize [
	super initialize.
	
	combination := BlKeyCombination return
]

{ #category : #accessing }
BrEditableLabelSwitchToEditorShortcut >> name [
	^ 'Switch to editor'
]

{ #category : #evaluation }
BrEditableLabelSwitchToEditorShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	aBrEditorElement switchToEditor
]
