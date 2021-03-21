"
BrTextEditorSurroundDefinition defines a character that the text editor will automatically close when the character is inserted, e.g. an opening bracket will have its closing bracket also inserted.

Some characters, e.g. quotes, should only be inserted if surrounded by spaces.  The optional condition can be specified to allow this.

!!Internal Representation and Key Implementation Points.

!!!Instance Variables
	closeCharacter:		<Character>
	condition:			<BlockClosure>
	openCharacter:		<Character>


!!!Implementation Points
"
Class {
	#name : #BrTextEditorSurroundDefinition,
	#superclass : #Object,
	#instVars : [
		'openCharacter',
		'closeCharacter',
		'condition'
	],
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #accessing }
BrTextEditorSurroundDefinition >> closeCharacter [
	^ closeCharacter
]

{ #category : #accessing }
BrTextEditorSurroundDefinition >> closeCharacter: anObject [
	closeCharacter := anObject
]

{ #category : #accessing }
BrTextEditorSurroundDefinition >> condition [
	^ condition
]

{ #category : #accessing }
BrTextEditorSurroundDefinition >> condition: anObject [
	condition := anObject
]

{ #category : #accessing }
BrTextEditorSurroundDefinition >> openCharacter [
	^ openCharacter
]

{ #category : #accessing }
BrTextEditorSurroundDefinition >> openCharacter: anObject [
	openCharacter := anObject
]
