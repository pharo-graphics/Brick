Class {
	#name : #BrDescriptionLook,
	#superclass : #BrLook,
	#traits : 'TBlTextStyleable',
	#classTraits : 'TBlTextStyleable classTrait',
	#instVars : [
		'attributesBuilder',
		'editor',
		'descriptionElement',
		'text'
	],
	#category : #'Brick-! Core'
}

{ #category : #accessing }
BrDescriptionLook >> attributesBuilder [
	<return: #BlTextAttributesBuilder>
	
	^ attributesBuilder
]

{ #category : #accessing }
BrDescriptionLook >> description [
	<return: #BrEditorElement>
	
	^ descriptionElement
]

{ #category : #accessing }
BrDescriptionLook >> descriptionDo: aBlock [	
	aBlock value: self description
]

{ #category : #initialization }
BrDescriptionLook >> initialize [
	super initialize.
	
	text := 'Description' asRopedText.
	
	editor := BrTextEditor new.
	
	descriptionElement := BrEditorElement new.
	descriptionElement editor: editor.

	attributesBuilder := BlTextDelegatedAttributesBuilder new.
	attributesBuilder attributesTarget: text.
	attributesBuilder whenAdded: [ descriptionElement text: text ]
]

{ #category : #initialization }
BrDescriptionLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrDescriptionChanged do: [ :anEvent | self text: anEvent text ]
]

{ #category : #initialization }
BrDescriptionLook >> initializeLook [
	super initializeLook.

	editor text: text.
	self widgetContent addChild: descriptionElement as: #description
]

{ #category : #initialization }
BrDescriptionLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrDescriptionRequest new
]

{ #category : #accessing }
BrDescriptionLook >> text [
	<return: #BlText>

	^ text
]

{ #category : #accessing }
BrDescriptionLook >> text: aTextOrString [
	text := aTextOrString asRopedText.
	
	self attributesBuilder attributesTarget: text.
	editor text: text
]
