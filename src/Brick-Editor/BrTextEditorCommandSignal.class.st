Class {
	#name : #BrTextEditorCommandSignal,
	#superclass : #BrTextEditorSignal,
	#instVars : [
		'command'
	],
	#category : #'Brick-Editor-Signals'
}

{ #category : #accessing }
BrTextEditorCommandSignal >> command [
	<return: #BrTextEditorCommand>

	^ command
]

{ #category : #accessing }
BrTextEditorCommandSignal >> command: aBrTextEditorCommand [
	command := aBrTextEditorCommand
]

{ #category : #printing }
BrTextEditorCommandSignal >> printOneLineContentsOn: aStream [
	"hook to be overriden by subclasses"
	
	aStream print: self command
]
