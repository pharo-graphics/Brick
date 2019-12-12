Class {
	#name : #BrTextEditorHistory,
	#superclass : #Object,
	#instVars : [
		'undoCommands',
		'redoCommands',
		'isEnabled'
	],
	#category : #'Brick-Editor-History'
}

{ #category : #private }
BrTextEditorHistory >> addCommand: aCommand [
	isEnabled
		ifFalse: [ ^ self ].

	undoCommands add: aCommand.
	redoCommands removeAll
]

{ #category : #'api - history' }
BrTextEditorHistory >> deletedText: aBlText at: anIndex [
	self addCommand: (BrTextEditorHistoryDeletionCommand new
		text: aBlText;
		index: anIndex)
]

{ #category : #'api - history' }
BrTextEditorHistory >> disableDuring: aBlock [
	| wasEnabled |
	
	wasEnabled := isEnabled.
	isEnabled := false.
	
	aBlock ensure: [ isEnabled := wasEnabled ]
]

{ #category : #initialization }
BrTextEditorHistory >> initialize [
	super initialize.
	
	undoCommands := OrderedCollection new.
	redoCommands := OrderedCollection new.

	isEnabled := true
]

{ #category : #'api - history' }
BrTextEditorHistory >> insertedString: aString at: anIndex [
	self addCommand: (BrTextEditorHistoryInsertionCommand new
		string: aString;
		index: anIndex)
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
