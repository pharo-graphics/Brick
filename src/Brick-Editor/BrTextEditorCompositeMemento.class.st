Class {
	#name : #BrTextEditorCompositeMemento,
	#superclass : #BrTextEditorMemento,
	#instVars : [
		'mementos'
	],
	#category : #'Brick-Editor-Model - Memento'
}

{ #category : #'api - memento' }
BrTextEditorCompositeMemento >> all [
	self
		cursors;
		history;
		inputFilter;
		mode;
		selection;
		shortcuts;
		styler;
		text
]

{ #category : #'api - memento' }
BrTextEditorCompositeMemento >> cursors [
	mementos add: BrTextEditorCursorsMemento new
]

{ #category : #'api - memento' }
BrTextEditorCompositeMemento >> history [
	mementos add: BrTextEditorHistoryMemento new
]

{ #category : #initialization }
BrTextEditorCompositeMemento >> initialize [
	super initialize.
	
	mementos := SortedCollection sortUsing: [ :a :b | a order < b order ]
]

{ #category : #'api - memento' }
BrTextEditorCompositeMemento >> inputFilter [
	mementos add: BrTextEditorInputFilterMemento new
]

{ #category : #'api - memento' }
BrTextEditorCompositeMemento >> mode [
	mementos add: BrTextEditorModeMemento new
]

{ #category : #accessing }
BrTextEditorCompositeMemento >> order [
	^ self shouldNotImplement
]

{ #category : #memento }
BrTextEditorCompositeMemento >> restoreStateOf: aTextEditor [
	mementos do: [ :eachMemento | eachMemento restoreStateOf: aTextEditor ]
]

{ #category : #memento }
BrTextEditorCompositeMemento >> saveStateOf: aTextEditor [
	mementos do: [ :eachMemento | eachMemento saveStateOf: aTextEditor ]
]

{ #category : #'api - memento' }
BrTextEditorCompositeMemento >> selection [
	mementos add: BrTextEditorSelectionMemento new
]

{ #category : #'api - memento' }
BrTextEditorCompositeMemento >> shortcuts [
	mementos add: BrTextEditorShortcutsMemento new
]

{ #category : #'api - memento' }
BrTextEditorCompositeMemento >> styler [
	mementos add: BrTextEditorStylerMemento new
]

{ #category : #'api - memento' }
BrTextEditorCompositeMemento >> text [
	mementos add: BrTextEditorTextMemento new
]
