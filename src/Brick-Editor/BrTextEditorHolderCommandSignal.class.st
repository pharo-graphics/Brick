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
