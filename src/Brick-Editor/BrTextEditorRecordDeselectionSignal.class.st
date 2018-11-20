"
I am signaled when selection recorder records a new motone deselection
"
Class {
	#name : #BrTextEditorRecordDeselectionSignal,
	#superclass : #BeaconSignal,
	#instVars : [
		'selection'
	],
	#category : 'Brick-Editor-Model - Selection'
}

{ #category : #printing }
BrTextEditorRecordDeselectionSignal >> printOneLineContentsOn: stream [
	self selection printOn: stream 
]

{ #category : #accessing }
BrTextEditorRecordDeselectionSignal >> selection [
	^ selection
]

{ #category : #accessing }
BrTextEditorRecordDeselectionSignal >> selection: anObject [
	selection := anObject
]
