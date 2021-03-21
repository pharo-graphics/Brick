Class {
	#name : #BrTextStyledEvent,
	#superclass : #BlEvent,
	#instVars : [
		'text',
		'afterAction',
		'editorElement'
	],
	#category : #'Brick-Editor-Model - Events'
}

{ #category : #accessing }
BrTextStyledEvent >> afterAction [
	^ afterAction ifNil: [ [ :aStyleText | "do nothing" ] ]
]

{ #category : #accessing }
BrTextStyledEvent >> afterAction: anObject [
	afterAction := anObject
]

{ #category : #accessing }
BrTextStyledEvent >> editorElement [
	^ editorElement
]

{ #category : #accessing }
BrTextStyledEvent >> editorElement: anObject [
	editorElement := anObject
]

{ #category : #accessing }
BrTextStyledEvent >> text [
	^ text
]

{ #category : #accessing }
BrTextStyledEvent >> text: anObject [
	text := anObject
]
