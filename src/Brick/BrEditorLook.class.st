Class {
	#name : #BrEditorLook,
	#superclass : #BrLook,
	#traits : 'TBlTextStyleable',
	#classTraits : 'TBlTextStyleable classTrait',
	#instVars : [
		'attributesBuilder'
	],
	#category : #'Brick-Editor - Look'
}

{ #category : #accessing }
BrEditorLook >> attributesBuilder [
	<return: #BlTextAttributesBuilder>
	
	^ attributesBuilder
]

{ #category : #initialization }
BrEditorLook >> initialize [
	super initialize.
	
	attributesBuilder := BlTextDelegatedAttributesBuilder new.
	attributesBuilder beNotOverwritableByStyler
]

{ #category : #initialization }
BrEditorLook >> initializeListeners [
	super initializeListeners.
	
	
]

{ #category : #initialization }
BrEditorLook >> initializeLook [
	super initializeLook.
	
	attributesBuilder attributesTarget: self widget text
]
