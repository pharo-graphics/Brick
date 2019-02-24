"
! Adornments

I am an attribute which when applied on a text visually replaces some parts of it with other items (not neccessarily character). Such attribtues requires complex text rendering system and currently only supported by the Moldable Editor.

See ${class:BrTextEditorAdornmentsExamples}$
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

{ #category : #initialization }
BrTextAdornmentAttribute >> initialize [
	super initialize.
	
	shouldAppend := false
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

{ #category : #comparing }
BrTextAdornmentAttribute >> type [
	^ self
]
