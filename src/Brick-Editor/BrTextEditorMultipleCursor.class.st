"
I am a composite cursor that is composed out of multiple single cursors
"
Class {
	#name : #BrTextEditorMultipleCursor,
	#superclass : #BrTextEditorCursor,
	#instVars : [
		'cursors'
	],
	#category : 'Brick-Editor-Model - Cursor'
}

{ #category : #adding }
BrTextEditorMultipleCursor >> add: aSingleCursor [
	self cursors add: aSingleCursor
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

{ #category : #initialization }
BrTextEditorMultipleCursor >> initialize [
	super initialize.

	cursors := OrderedCollection new
]

{ #category : #printing }
BrTextEditorMultipleCursor >> printOn: aStream [

	self isEmpty
		ifTrue: [ aStream nextPutAll: 'Empty' ]
		ifFalse: [ aStream print: self cursors ]
]

{ #category : #adding }
BrTextEditorMultipleCursor >> remove: aSingleCursor [
	self cursors remove: aSingleCursor
]
