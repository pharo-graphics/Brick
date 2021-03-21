Class {
	#name : #BrTextEditorSignal,
	#superclass : #BeaconSignal,
	#instVars : [
		'textEditor'
	],
	#category : #'Brick-Editor-Signals'
}

{ #category : #'instance creation' }
BrTextEditorSignal class >> textEditor: aBrTextEditor [
	^ self new textEditor: aBrTextEditor
]

{ #category : #accessing }
BrTextEditorSignal >> textEditor [
	^ textEditor
]

{ #category : #accessing }
BrTextEditorSignal >> textEditor: anObject [
	textEditor := anObject
]
