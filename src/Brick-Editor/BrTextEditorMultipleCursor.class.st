"
I am a composite cursor that is composed out of multiple single cursors
"
Class {
	#name : #BrTextEditorMultipleCursor,
	#superclass : #BrTextEditorCursor,
	#instVars : [
		'cursors'
	],
	#category : #'Brick-Editor-Model - Cursor'
}

{ #category : #comparing }
BrTextEditorMultipleCursor >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].

	^ anotherObject cursors = self cursors
]

{ #category : #adding }
BrTextEditorMultipleCursor >> add: aSingleCursor [
	self cursors add: aSingleCursor
]

{ #category : #adding }
BrTextEditorMultipleCursor >> addAll: aCollectionOfSingleCursor [
	self cursors addAll: aCollectionOfSingleCursor
]

{ #category : #accessing }
BrTextEditorMultipleCursor >> cursors [
	<return: #Collection of: #BrTextEditorCursor>

	^ cursors
]

{ #category : #enumerating }
BrTextEditorMultipleCursor >> do: aBlock [
	"Evaluate a given block with all available cursors"

	^ self cursors do: aBlock
]

{ #category : #comparing }
BrTextEditorMultipleCursor >> hash [
	^ self class hash bitXor: self cursors hash
]

{ #category : #initialization }
BrTextEditorMultipleCursor >> initialize [
	super initialize.

	cursors := OrderedCollection new
]

{ #category : #copying }
BrTextEditorMultipleCursor >> postCopy [
	cursors := cursors copy
]

{ #category : #printing }
BrTextEditorMultipleCursor >> printOn: aStream [

	self isEmpty
		ifTrue: [ aStream nextPutAll: 'Empty' ]
		ifFalse: [ aStream nextPutAll: ($, join: self cursors) ]
]

{ #category : #adding }
BrTextEditorMultipleCursor >> remove: aSingleCursor [
	self cursors remove: aSingleCursor
]
