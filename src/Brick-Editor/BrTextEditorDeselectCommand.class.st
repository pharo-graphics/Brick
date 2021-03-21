"
I deselect an interval of text from ===fromIndex=== to ===toIndex===
"
Class {
	#name : #BrTextEditorDeselectCommand,
	#superclass : #BrTextEditorCommand,
	#instVars : [
		'fromIndex',
		'toIndex'
	],
	#category : #'Brick-Editor-Commands'
}

{ #category : #executing }
BrTextEditorDeselectCommand >> executeOn: aTextEditor [

	aTextEditor selection isEmpty
		ifTrue: [ ^ self ].

	aTextEditor selection deselect: self fromIndex to: self toIndex.
	aTextEditor updateSelection: self fromIndex to: self toIndex.
	aTextEditor notifySelectionChanged: aTextEditor selection
]

{ #category : #accessing }
BrTextEditorDeselectCommand >> fromIndex [
	^ fromIndex
]

{ #category : #accessing }
BrTextEditorDeselectCommand >> fromIndex: anObject [
	fromIndex := anObject
]

{ #category : #accessing }
BrTextEditorDeselectCommand >> toIndex [
	^ toIndex
]

{ #category : #accessing }
BrTextEditorDeselectCommand >> toIndex: anObject [
	toIndex := anObject
]
