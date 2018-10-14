"
I am an attribute which when applied on a text visually replaces some parts of it with other items (not neccessarily character).

By default I visually delete a piece of text I am applied on.

Requires complex text rendering system and may only be supported by text editor.
"
Class {
	#name : #BrTextAdornmentAttribute,
	#superclass : #BlTextAttribute,
	#instVars : [
		'shouldAppend'
	],
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #accessing }
BrTextAdornmentAttribute >> affect: aBrText in: anEditorElement [
	"Return a collection of objects (may be empty) that should affect (either append or replace) a provided text piece"
	<return: #SequenceableCollection of: #BlElement>

	^ self subclassResponsibility
]

{ #category : #accessing }
BrTextAdornmentAttribute >> beAppend [
	shouldAppend := true
]

{ #category : #accessing }
BrTextAdornmentAttribute >> beReplace [
	shouldAppend := false
]

{ #category : #comparing }
BrTextAdornmentAttribute >> equals: aTextAttribute [
	^ aTextAttribute class = self class
]

{ #category : #comparing }
BrTextAdornmentAttribute >> hash [
	^ self class hash
]

{ #category : #initialization }
BrTextAdornmentAttribute >> initialize [
	super initialize.
	
	shouldAppend := false.
]

{ #category : #testing }
BrTextAdornmentAttribute >> isAdornment [
	"Return true if attribute influences text structure, for examples if it replaces one or more characters
	with any amount of other arbitrary items, false otherwise"
	<return: #Boolean>

	^ true
]

{ #category : #testing }
BrTextAdornmentAttribute >> isStyle [
	^ false
]

{ #category : #testing }
BrTextAdornmentAttribute >> shouldAppend [
	^ shouldAppend
]

{ #category : #testing }
BrTextAdornmentAttribute >> shouldReplace [
	^ shouldAppend not
]
