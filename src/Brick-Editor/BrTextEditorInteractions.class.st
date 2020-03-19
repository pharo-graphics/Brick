Class {
	#name : #BrTextEditorInteractions,
	#superclass : #Object,
	#instVars : [
		'interactions'
	],
	#category : #'Brick-Editor-Model'
}

{ #category : #'adding / removing' }
BrTextEditorInteractions >> add: aNewShortcut ifReplaced: aReplacedBlock [
	"I add a new interaction shortcut or replace existing if a shortcut for the same combination already exists and evaluate aReplacedBlock if it was the case"
	
	interactions
		at: aNewShortcut combination
		ifPresent: [ :anExistingShortcut |
			interactions at: aNewShortcut combination put: aNewShortcut.
			aReplacedBlock value: anExistingShortcut ]
		ifAbsentPut: [ aNewShortcut ]
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
		ifPresent: [ :anExistingShortcut |
			anExistingShortcut = anInteraction
				ifTrue: [
					interactions removeKey: anInteraction combination.
					aFoundBlock value: anExistingShortcut ] ]
]
