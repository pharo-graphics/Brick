"
I am sent to the segment piece element when text inside it changes.
"
Class {
	#name : #BrTextEditorTextChangedRequest,
	#superclass : #BrTextEditorRequest,
	#instVars : [
		'segmentPiece',
		'text',
		'textStart',
		'textEnd'
	],
	#category : #'Brick-Editor-UI - Requests'
}

{ #category : #accessing }
BrTextEditorTextChangedRequest >> segmentPiece [
	^ segmentPiece
]

{ #category : #accessing }
BrTextEditorTextChangedRequest >> segmentPiece: anObject [
	segmentPiece := anObject
]

{ #category : #accessing }
BrTextEditorTextChangedRequest >> text [
	^ text
]

{ #category : #accessing }
BrTextEditorTextChangedRequest >> text: anObject [
	text := anObject
]

{ #category : #accessing }
BrTextEditorTextChangedRequest >> textEnd [
	^ textEnd
]

{ #category : #accessing }
BrTextEditorTextChangedRequest >> textEnd: anObject [
	textEnd := anObject
]

{ #category : #accessing }
BrTextEditorTextChangedRequest >> textStart [
	^ textStart
]

{ #category : #accessing }
BrTextEditorTextChangedRequest >> textStart: anObject [
	textStart := anObject
]
