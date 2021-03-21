Class {
	#name : #BrTextEditorShortcutsMemento,
	#superclass : #BrTextEditorMemento,
	#instVars : [
		'shortcuts'
	],
	#category : #'Brick-Editor-Model - Memento'
}

{ #category : #initialization }
BrTextEditorShortcutsMemento >> initialize [
	super initialize.
	
	shortcuts := BrTextEditorShortcuts new
]

{ #category : #evaluating }
BrTextEditorShortcutsMemento >> label [
	^ 'Shortcuts'
]

{ #category : #accessing }
BrTextEditorShortcutsMemento >> order [
	^ 10
]

{ #category : #memento }
BrTextEditorShortcutsMemento >> restoreStateOf: aTextEditor [
	aTextEditor setEditorShortcuts: shortcuts copy
]

{ #category : #memento }
BrTextEditorShortcutsMemento >> saveStateOf: aTextEditor [
	shortcuts := aTextEditor editorShortcuts copy
]

{ #category : #evaluating }
BrTextEditorShortcutsMemento >> value [
	^ shortcuts
]
