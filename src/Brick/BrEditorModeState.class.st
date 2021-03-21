Class {
	#name : #BrEditorModeState,
	#superclass : #BlElementState,
	#instVars : [
		'mode'
	],
	#category : #'Brick-Editor - Model'
}

{ #category : #'instance creation' }
BrEditorModeState class >> editable [
	^ self new mode: BrTextEditorEditableMode
]

{ #category : #'instance creation' }
BrEditorModeState class >> mode: aTextEditorModeClass [
	^ self new mode: aTextEditorModeClass
]

{ #category : #'instance creation' }
BrEditorModeState class >> readOnly [
	^ self readOnlyWithSelection or: self readOnlyWithoutSelection
]

{ #category : #'instance creation' }
BrEditorModeState class >> readOnlyWithSelection [
	^ self new mode: BrTextEditorReadonlyWithSelectionMode 
]

{ #category : #'instance creation' }
BrEditorModeState class >> readOnlyWithoutSelection [
	^ self new mode: BrTextEditorReadonlyWithoutSelectionMode
]

{ #category : #comparing }
BrEditorModeState >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ mode = anObject mode
]

{ #category : #comparing }
BrEditorModeState >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ mode hash
]

{ #category : #accessing }
BrEditorModeState >> mode [
	<return: #Class>

	^ mode
]

{ #category : #accessing }
BrEditorModeState >> mode: aModeClass [
	mode := aModeClass
]

{ #category : #accessing }
BrEditorModeState >> priority [
	^ UserPriority
]

{ #category : #accessing }
BrEditorModeState >> type [
	"Return an object used to compare two states when adding to the collection of states in order to prevent
	elements from having duplicated states"
	<return: #Object>

	^ self class
]
