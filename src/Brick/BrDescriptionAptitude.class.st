Class {
	#name : #BrDescriptionAptitude,
	#superclass : #BrAptitude,
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
BrDescriptionAptitude >> attributesBuilder [
	<return: #BlTextAttributesBuilder>
	
	^ attributesBuilder
]

{ #category : #accessing }
BrDescriptionAptitude >> description [
	<return: #BrEditorElement>
	
	^ descriptionElement
]

{ #category : #accessing }
BrDescriptionAptitude >> descriptionDo: aBlock [	
	aBlock value: self description
]

{ #category : #initialization }
BrDescriptionAptitude >> fitContent [
	descriptionElement
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent ]
]

{ #category : #initialization }
BrDescriptionAptitude >> initialize [
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
BrDescriptionAptitude >> initializeListeners [
	super initializeListeners.
	
	self when: BrDescriptionChanged do: [ :anEvent | self text: anEvent text ]
]

{ #category : #initialization }
BrDescriptionAptitude >> initializeRequests [
	super initializeRequests.
	
	self request: BrDescriptionRequest new
]

{ #category : #initialization }
BrDescriptionAptitude >> readonly [
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
BrDescriptionAptitude >> text [
	<return: #BlText>

	^ text
]

{ #category : #accessing }
BrDescriptionAptitude >> text: aTextOrString [
	text := aTextOrString asRopedText.
	
	self attributesBuilder attributesTarget: text.
	editor text: text
]
