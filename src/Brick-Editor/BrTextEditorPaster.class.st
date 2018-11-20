Class {
	#name : #BrTextEditorPaster,
	#superclass : #BrTextEditorOperator,
	#instVars : [
		'text',
		'insertionIndices',
		'shouldUpdateCursor',
		'shouldUpdateSelection',
		'shouldDeleteSelected'
	],
	#category : #'Brick-Editor-Model'
}

{ #category : #'api - configuration' }
BrTextEditorPaster >> at: anIndex [
	"Add a given index as another text paste location"

	(insertionIndices includes: anIndex)
		ifFalse: [ insertionIndices add: anIndex ]
]

{ #category : #'api - configuration' }
BrTextEditorPaster >> atCursor [	
	self cursor do: [ :aCursor | self at: aCursor position ]
]

{ #category : #'api - configuration' }
BrTextEditorPaster >> atEnd [
	"Insert a text at the very end"
	self at: self text size
]

{ #category : #'api - configuration' }
BrTextEditorPaster >> fromClipboard [
	self string: Clipboard clipboardText asString
]

{ #category : #initialization }
BrTextEditorPaster >> initialize [
	super initialize.
	
	insertionIndices := SortedCollection new.
	shouldUpdateCursor := true.
	shouldUpdateSelection := true.
	shouldDeleteSelected := true
]

{ #category : #'api - processing' }
BrTextEditorPaster >> paste [
	| anInserter |
	
	anInserter := self editor inserter.
	anInserter text: text.
	anInserter shouldDeleteSelected: shouldDeleteSelected.
	anInserter shouldUpdateCursor: shouldUpdateCursor.
	anInserter shouldUpdateSelection: shouldUpdateSelection.
	insertionIndices do: [ :anIndex | anInserter at: anIndex ].

	anInserter insert
]

{ #category : #'api - configuration' }
BrTextEditorPaster >> string: aString [
	text := aString
]

{ #category : #'api - configuration' }
BrTextEditorPaster >> text: aText [
	text := aText
]

{ #category : #'api - configuration' }
BrTextEditorPaster >> withoutCursorUpdate [
	shouldUpdateCursor := false
]

{ #category : #'api - configuration' }
BrTextEditorPaster >> withoutSelectionDelete [
	shouldDeleteSelected := false
]

{ #category : #'api - configuration' }
BrTextEditorPaster >> withoutSelectionUpdate [
	shouldUpdateSelection := false
]
