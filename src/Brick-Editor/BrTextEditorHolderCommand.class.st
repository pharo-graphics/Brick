"
I am a payload to trigger partial text update without re-creation of text pieces
"
Class {
	#name : #BrTextEditorHolderCommand,
	#superclass : #BlEvent,
	#instVars : [
		'context'
	],
	#category : #'Brick-Editor-Commands-Holder'
}

{ #category : #accessing }
BrTextEditorHolderCommand >> context [
	^ context
]

{ #category : #accessing }
BrTextEditorHolderCommand >> context: anObject [
	context := anObject
]

{ #category : #executing }
BrTextEditorHolderCommand >> executeOn: aSegmentHolder [
	self subclassResponsibility
]

{ #category : #sending }
BrTextEditorHolderCommand >> sendTo: aSegmentHolder [
	self executeOn: aSegmentHolder
]

{ #category : #accessing }
BrTextEditorHolderCommand >> telemetry [
	<return: #BlTelemetry>

	^ self context
		ifNil: [ BlNullTelemetry uniqueInstance ]
		ifNotNil: [ :aContext | aContext telemetry ]
]
