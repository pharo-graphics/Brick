"
Is sent by the text editor after a new piece of text is inserted in the editor at a location defined by an insertion index
"
Class {
	#name : #BrTextEditorInsertedEvent,
	#superclass : #BrTextEditorEvent,
	#instVars : [
		'text',
		'index'
	],
	#category : #'Brick-Editor-Model - Events'
}

{ #category : #'instance creation' }
BrTextEditorInsertedEvent class >> text: aBlText at: anIndex [
	<return: #BrTextEditorInsertedEvent>

	^ self new
		text: aBlText;
		index: anIndex
]

{ #category : #accessing }
BrTextEditorInsertedEvent >> index [
	^ index
]

{ #category : #accessing }
BrTextEditorInsertedEvent >> index: aNumber [
	index := aNumber
]

{ #category : #accessing }
BrTextEditorInsertedEvent >> text [
	^ text
]

{ #category : #accessing }
BrTextEditorInsertedEvent >> text: aBrText [
	text := aBrText
]
