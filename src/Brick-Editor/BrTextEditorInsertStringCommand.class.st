"
I insert a string at an index and request editor update.

I do not change cursor position or selection interval.
"
Class {
	#name : #BrTextEditorInsertStringCommand,
	#superclass : #BrTextEditorCommand,
	#instVars : [
		'string',
		'index'
	],
	#category : #'Brick-Editor-Commands'
}

{ #category : #executing }
BrTextEditorInsertStringCommand >> executeOn: aTextEditor [

	aTextEditor text
		insertString: self string
		at: self index
]

{ #category : #accessing }
BrTextEditorInsertStringCommand >> index [
	<return: #Number>

	^ index
]

{ #category : #accessing }
BrTextEditorInsertStringCommand >> index: aNumber [
	index := aNumber
]

{ #category : #accessing }
BrTextEditorInsertStringCommand >> string [
	<return: #String>

	^ string
]

{ #category : #accessing }
BrTextEditorInsertStringCommand >> string: aString [

	self
		assert: [ aString isEmpty not ]
		description: [ 'Can not insert an empty string (does not make sense)' ].

	string := aString
]
