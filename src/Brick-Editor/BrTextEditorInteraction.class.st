Class {
	#name : #BrTextEditorInteraction,
	#superclass : #Object,
	#instVars : [
		'combination',
		'action',
		'shortcut',
		'isOverwritableByMode'
	],
	#category : #'Brick-Editor-Model'
}

{ #category : #'instance creation' }
BrTextEditorInteraction class >> fromAssociation: anAssociation [
	^ self new
		combination: anAssociation key;
		action: anAssociation value
]

{ #category : #comparing }
BrTextEditorInteraction >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ combination = anObject combination
		and: [ action = anObject action ]
]

{ #category : #accessing }
BrTextEditorInteraction >> action [
	^ action
]

{ #category : #accessing }
BrTextEditorInteraction >> action: anObject [
	action := anObject
]

{ #category : #converting }
BrTextEditorInteraction >> asShortcut [
	<return: #BlShortcut>

	^ shortcut ifNil: [
		shortcut := BlShortcut new
			combination: self combination;
			action: [ :anEvent | self action
				cull: anEvent currentTarget editor
				cull: anEvent ] ]
]

{ #category : #accessing }
BrTextEditorInteraction >> beNotOverwritableByMode [
	isOverwritableByMode := false
]

{ #category : #accessing }
BrTextEditorInteraction >> beOverwritableByMode [
	isOverwritableByMode := true
]

{ #category : #accessing }
BrTextEditorInteraction >> combination [
	^ combination
]

{ #category : #accessing }
BrTextEditorInteraction >> combination: anObject [
	combination := anObject
]

{ #category : #comparing }
BrTextEditorInteraction >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ combination hash bitXor: action hash
]

{ #category : #initialization }
BrTextEditorInteraction >> initialize [
	super initialize.
	
	isOverwritableByMode := true
]

{ #category : #accessing }
BrTextEditorInteraction >> isOverwritableByMode [
	<return: #Boolean>

	^ isOverwritableByMode
]
