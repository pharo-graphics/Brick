Class {
	#name : #BrTextEditorHolderCommandSignal,
	#superclass : #BrTextEditorSignal,
	#instVars : [
		'command',
		'interval'
	],
	#category : #'Brick-Editor-Signals'
}

{ #category : #accessing }
BrTextEditorHolderCommandSignal >> command [
	^ command
]

{ #category : #accessing }
BrTextEditorHolderCommandSignal >> command: anObject [
	command := anObject
]

{ #category : #accessing }
BrTextEditorHolderCommandSignal >> interval [
	^ interval
]

{ #category : #accessing }
BrTextEditorHolderCommandSignal >> interval: anObject [
	interval := anObject
]

{ #category : #printing }
BrTextEditorHolderCommandSignal >> printOneLineContentsOn: aStream [
	"hook to be overriden by subclasses"
	
	aStream
		print: self command;
		nextPutAll: ' within ';
		print: self interval
]
