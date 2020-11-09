Class {
	#name : #BrEditorShortcut,
	#superclass : #BlBasicShortcut,
	#category : #'Brick-Editor-Shortcuts'
}

{ #category : #evaluation }
BrEditorShortcut >> performDueTo: aShortcutEvent [

	"we consume shortcut event before evaluating a custom action in order to give subclasses a chance to not consume the event"
	aShortcutEvent consumed: true.

	self
		performOnEditor: aShortcutEvent currentTarget editor
		element: aShortcutEvent currentTarget
		dueTo: aShortcutEvent
]

{ #category : #evaluation }
BrEditorShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement dueTo: aShortcutEvent [
	self subclassResponsibility
]
