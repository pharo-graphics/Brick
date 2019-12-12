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
