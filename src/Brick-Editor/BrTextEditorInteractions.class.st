Class {
	#name : #BrTextEditorInteractions,
	#superclass : #Object,
	#instVars : [
		'interactions'
	],
	#category : #'Brick-Editor-Model'
}

{ #category : #'adding / removing' }
BrTextEditorInteractions >> add: aNewInteraction ifAdded: anAddedBlock ifReplaced: aReplacedBlock [
	"I add a new interaction shortcut or replace an existing one for the same combination and evaluate aReplacedBlock if it was the case"

	interactions
		at: aNewInteraction combination
		ifPresent: [ :anExistingInteraction |
			(anExistingInteraction isOverwritableByMode
				or: [ aNewInteraction isOverwritableByMode not ])
					ifTrue: [
						interactions at: aNewInteraction combination put: aNewInteraction.
						aReplacedBlock value: anExistingInteraction.
						anAddedBlock value: aNewInteraction.
					] ]
		ifAbsent: [
			interactions at: aNewInteraction combination put: aNewInteraction.
			anAddedBlock value: aNewInteraction ]
]

{ #category : #enumerating }
BrTextEditorInteractions >> do: aBlock [
	interactions do: aBlock
]

{ #category : #initialization }
BrTextEditorInteractions >> initialize [
	super initialize.
	
	interactions := Dictionary new
]

{ #category : #'adding / removing' }
BrTextEditorInteractions >> remove: anInteraction ifFound: aFoundBlock [
	
	interactions
		at: anInteraction combination
		ifPresent: [ :anExistingInteraction |
			anExistingInteraction = anInteraction
				ifTrue: [
					interactions removeKey: anInteraction combination.
					aFoundBlock value: anExistingInteraction ] ]
]
