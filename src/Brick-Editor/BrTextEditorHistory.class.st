Class {
	#name : #BrTextEditorHistory,
	#superclass : #Object,
	#instVars : [
		'undoCommands',
		'redoCommands',
		'isEnabled',
		'shouldGroup'
	],
	#category : #'Brick-Editor-History'
}

{ #category : #private }
BrTextEditorHistory >> addCommand: aCommand [
	isEnabled
		ifFalse: [ ^ self ].
		
	shouldGroup
		ifTrue: [ 
			| aCompositeCommand |
			aCompositeCommand := undoCommands
				ifEmpty: [ BrTextEditorHistoryCompositeCommand new in: [ :newGroup | undoCommands add: newGroup ]; yourself ]
				ifNotEmpty: [ undoCommands last isGroup
					ifTrue: [ undoCommands last ]
					ifFalse: [ BrTextEditorHistoryCompositeCommand new in: [ :newGroup | undoCommands add: newGroup ]; yourself ] ].
			aCompositeCommand addCommand: aCommand ]
		ifFalse: [ undoCommands add: aCommand ].
	redoCommands removeAll
]

{ #category : #'api - history' }
BrTextEditorHistory >> cursorsMovedFrom: aCollectionOfFromIndices to: aCollectionOfToIndices [
	self addCommand: (BrTextEditorHistoryCursorMovementCommand new
		fromIndices: aCollectionOfFromIndices;
		toIndices: aCollectionOfToIndices)
]

{ #category : #'api - history' }
BrTextEditorHistory >> deletedTexts: aCollectionOfTexts undo: aCollectionOfUndoIndices redo: aCollectionOfRedoIndices [
	self addCommand: (BrTextEditorHistoryDeletionCommand new
		texts: aCollectionOfTexts;
		undoIndices: aCollectionOfUndoIndices;
		redoIndices: aCollectionOfRedoIndices)
]

{ #category : #'api - history' }
BrTextEditorHistory >> disableDuring: aBlock [
	| wasEnabled |
	
	wasEnabled := isEnabled.
	isEnabled := false.
	
	aBlock ensure: [ isEnabled := wasEnabled ]
]

{ #category : #'api - history' }
BrTextEditorHistory >> groupDuring: aBlock [
	| wasGrouped |
	
	wasGrouped := shouldGroup.
	shouldGroup := true.
	
	aBlock ensure: [ shouldGroup := wasGrouped ]
]

{ #category : #initialization }
BrTextEditorHistory >> initialize [
	super initialize.
	
	undoCommands := OrderedCollection new.
	redoCommands := OrderedCollection new.

	isEnabled := true.
	
	"when set to false all commands are added individually, otherwise they end up in a composite group"
	shouldGroup := false
]

{ #category : #'api - history' }
BrTextEditorHistory >> insertedStrings: aCollectionOfStrings undo: aCollectionOfUndoIndices redo: aCollectionOfRedoIndices [
	self addCommand: (BrTextEditorHistoryInsertionCommand new
		strings: aCollectionOfStrings;
		undoIndices: aCollectionOfUndoIndices;
		redoIndices: aCollectionOfRedoIndices)
]

{ #category : #'api - undo/redo' }
BrTextEditorHistory >> redoOn: aBrTextEditor [
	redoCommands ifNotEmpty: [ :theCommands |
		self disableDuring: [ undoCommands add: (theCommands removeLast redoOn: aBrTextEditor) ] ]
]

{ #category : #'api - undo/redo' }
BrTextEditorHistory >> undoOn: aBrTextEditor [
	undoCommands ifNotEmpty: [ :theCommands |
		self disableDuring: [ redoCommands add: (theCommands removeLast undoOn: aBrTextEditor) ] ]
]
