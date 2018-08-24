"
I am signaled when selection recorder records a new motone selection
"
Class {
	#name : #BrTextEditorRecordSelectionSignal,
	#superclass : #BeaconSignal,
	#instVars : [
		'selection'
	],
	#category : 'Brick-Editor-Model - Selection'
}

{ #category : #printing }
BrTextEditorRecordSelectionSignal >> printOneLineContentsOn: stream [
	self selection printOn: stream 
]

{ #category : #accessing }
BrTextEditorRecordSelectionSignal >> selection [
	^ selection
]

{ #category : #accessing }
BrTextEditorRecordSelectionSignal >> selection: anObject [
	selection := anObject
]
