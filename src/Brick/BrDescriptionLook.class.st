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
	#category : #'Brick-! Core - Looks'
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
BrDescriptionLook >> fitContent [
	descriptionElement
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent ]
]

{ #category : #initialization }
BrDescriptionLook >> initialize [
	super initialize.
	text := 'Description' asRopedText.
	editor := BrTextEditor new.
	descriptionElement := BrEditorElement new.
	descriptionElement editor: editor.
	descriptionElement
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal matchParent ].
	attributesBuilder := BlTextDelegatedAttributesBuilder new.
	attributesBuilder attributesTarget: text.
	attributesBuilder whenAdded: [ editor text: text ].
	self
		addChangeAddChildAs: #(content description)
		with: [ descriptionElement ]
]

{ #category : #initialization }
BrDescriptionLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrDescriptionChanged do: [ :anEvent | self text: anEvent text ]
]

{ #category : #initialization }
BrDescriptionLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrDescriptionRequest new
]

{ #category : #initialization }
BrDescriptionLook >> readonly [
	editor segmentBuilder
		wordStencil: [ :aTBrTextEditorTextualPiece |
			| aTextElement |
			aTextElement := BrTextElementWithCursors new
				editorMeasurement
				segmentPiece: aTBrTextEditorTextualPiece.
			aTextElement ].
	descriptionElement preventMeAndChildrenMouseEvents
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
