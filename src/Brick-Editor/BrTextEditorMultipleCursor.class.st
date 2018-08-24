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

{ #category : #initialization }
BrTextEditorMultipleCursor >> initialize [
	super initialize.
	
	cursors := SortedCollection sortBlock: [ :a :b | a position < b position ]
]
