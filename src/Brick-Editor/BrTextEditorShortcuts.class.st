Class {
	#name : #BrTextEditorShortcuts,
	#superclass : #Object,
	#instVars : [
		'shortcuts'
	],
	#category : #'Brick-Editor-Model'
}

{ #category : #'adding / removing' }
BrTextEditorShortcuts >> add: aNewEditorShortcut ifAdded: anAddedBlock ifReplaced: aReplacedBlock [
	"I add a new interaction shortcut or replace an existing one for the same combination and evaluate aReplacedBlock if it was the case"

	shortcuts
		at: aNewEditorShortcut combination
		ifPresent: [ :anExistingEditorShortcut |
			(anExistingEditorShortcut isOverwritableByMode
				or: [ aNewEditorShortcut isOverwritableByMode not ])
					ifTrue: [
						shortcuts at: aNewEditorShortcut combination put: aNewEditorShortcut.
						aReplacedBlock value: anExistingEditorShortcut.
						anAddedBlock value: aNewEditorShortcut.
					] ]
		ifAbsent: [
			shortcuts at: aNewEditorShortcut combination put: aNewEditorShortcut.
			anAddedBlock value: aNewEditorShortcut ]
]

{ #category : #enumerating }
BrTextEditorShortcuts >> do: aBlock [
	shortcuts do: aBlock
]

{ #category : #initialization }
BrTextEditorShortcuts >> initialize [
	super initialize.
	
	shortcuts := Dictionary new
]

{ #category : #copying }
BrTextEditorShortcuts >> postCopy [
	shortcuts := shortcuts copy
]

{ #category : #'adding / removing' }
BrTextEditorShortcuts >> remove: anEditorShortcut ifFound: aFoundBlock [
	
	shortcuts
		at: anEditorShortcut combination
		ifPresent: [ :anExistingEditorShortcut |
			anExistingEditorShortcut = anEditorShortcut
				ifTrue: [
					shortcuts removeKey: anEditorShortcut combination.
					aFoundBlock value: anExistingEditorShortcut ] ]
]

{ #category : #'adding / removing' }
BrTextEditorShortcuts >> removeAllShortcutsAndDo: aFoundBlock [
	| theOldShortcuts |
	
	theOldShortcuts := shortcuts.
	shortcuts := Dictionary new.
	theOldShortcuts valuesDo: aFoundBlock
]
