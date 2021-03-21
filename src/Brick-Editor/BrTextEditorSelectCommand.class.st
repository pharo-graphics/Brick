"
I select an interval of text from ===fromIndex=== to ===toIndex===.
I do not remove existing selections, I just add new one on top merging overlapping intervals
"
Class {
	#name : #BrTextEditorSelectCommand,
	#superclass : #BrTextEditorCommand,
	#instVars : [
		'fromIndex',
		'toIndex'
	],
	#category : #'Brick-Editor-Commands'
}

{ #category : #executing }
BrTextEditorSelectCommand >> executeOn: aTextEditor [

	self fromIndex = self toIndex
		ifTrue: [ ^ self ].

	aTextEditor selection select: self fromIndex to: self toIndex.
	aTextEditor updateSelection: self fromIndex to: self toIndex.
	aTextEditor notifySelectionChanged: aTextEditor selection
]

{ #category : #accessing }
BrTextEditorSelectCommand >> fromIndex [
	^ fromIndex
]

{ #category : #accessing }
BrTextEditorSelectCommand >> fromIndex: anObject [
	fromIndex := anObject
]

{ #category : #accessing }
BrTextEditorSelectCommand >> toIndex [
	^ toIndex
]

{ #category : #accessing }
BrTextEditorSelectCommand >> toIndex: anObject [
	toIndex := anObject
]
