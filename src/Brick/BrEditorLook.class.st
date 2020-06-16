Class {
	#name : #BrEditorLook,
	#superclass : #BrLook,
	#traits : 'TBlTextStyleable',
	#classTraits : 'TBlTextStyleable classTrait',
	#instVars : [
		'attributesBuilder',
		'text',
		'styler',
		'mode'
	],
	#category : #'Brick-Editor - Look'
}

{ #category : #accessing }
BrEditorLook >> attributesBuilder [
	<return: #BlTextAttributesBuilder>
	
	^ attributesBuilder
]

{ #category : #accessing }
BrEditorLook >> attributesBuilder: aBlTextAttributesBuilder [

	self 
		assert: [ aBlTextAttributesBuilder isNotNil ] 
		description: [ 'Attributes builder must be non-nil' ].
	
	aBlTextAttributesBuilder beNotOverwritableByStyler.
	aBlTextAttributesBuilder whenAdded: [  ].
	aBlTextAttributesBuilder attributesTarget: text.
	
	attributesBuilder := aBlTextAttributesBuilder.
]

{ #category : #initialization }
BrEditorLook >> initialize [
	super initialize.
	
	styler := BlTextNullStyler new.
	text := '' asRopedText.
	mode := BrTextEditorNullMode new.
	
	self attributesBuilder: BlTextDelegatedAttributesBuilder new.
	
	self add: BrLayoutResizerLook inherit
]

{ #category : #initialization }
BrEditorLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrEditorStylerChanged do: [ :anEvent | self styler: anEvent styler ].
	self when: BrEditorTextChanged do: [ :anEvent | self text: anEvent text ].
	self when: BrEditorModeChanged do: [ :anEvent | self mode: anEvent mode ]
]

{ #category : #initialization }
BrEditorLook >> initializeRequests [
	super initializeRequests.

	self request: BrEditorStylerRequest new.
	self request: BrEditorTextRequest new.
	self request: BrEditorModeRequest new
]

{ #category : #accessing }
BrEditorLook >> mode: aTextEditorMode [
	mode := aTextEditorMode.	
	self widgetDo: [ :aWidget | aWidget editor editorMode: aTextEditorMode ]
]

{ #category : #accessing }
BrEditorLook >> styler: aStyler [
	styler := aStyler.
	
	self widgetDo: [ :aWidget | aWidget editor styler: aStyler ]
]

{ #category : #accessing }
BrEditorLook >> text: aText [
	text := aText.
	attributesBuilder attributesTarget: text.
	
	self widgetDo: [ :aWidget | aWidget editor text: aText ]
]
