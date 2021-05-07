Class {
	#name : #BrEditorAptitude,
	#superclass : #BrAptitude,
	#traits : 'TBlTextStyleable',
	#classTraits : 'TBlTextStyleable classTrait',
	#instVars : [
		'attributesBuilder',
		'text',
		'styler'
	],
	#category : #'Brick-Editor - Look'
}

{ #category : #accessing }
BrEditorAptitude >> attributesBuilder [
	<return: #BlTextAttributesBuilder>
	
	^ attributesBuilder
]

{ #category : #initialization }
BrEditorAptitude >> initialize [
	super initialize.
	
	styler := BlTextNullStyler new.
	text := '' asRopedText.
	
	attributesBuilder := BlTextDelegatedAttributesBuilder new attributesTarget: text.
	attributesBuilder beNotOverwritableByStyler.
	attributesBuilder whenAdded: [  ].
	
	self add: BrLayoutResizerAptitude inherit
]

{ #category : #initialization }
BrEditorAptitude >> initializeListeners [
	super initializeListeners.
	
	self when: BrEditorStylerChanged do: [ :anEvent | self styler: anEvent styler ].
	self when: BrEditorTextChanged do: [ :anEvent | self text: anEvent text ].
	self when: BrEditorModeChanged do: [ :anEvent | self mode: anEvent mode ]
]

{ #category : #initialization }
BrEditorAptitude >> initializeRequests [
	super initializeRequests.

	self request: BrEditorStylerRequest new.
	self request: BrEditorTextRequest new.
	self request: BrEditorModeRequest new
]

{ #category : #accessing }
BrEditorAptitude >> mode: aTextEditorMode [	
	self widgetDo: [ :aWidget |
		aWidget editor editorMode: aTextEditorMode.
		aWidget states addState: (BrEditorModeState mode: aTextEditorMode class) ]
]

{ #category : #accessing }
BrEditorAptitude >> styler: aStyler [
	styler := aStyler.
	
	self widgetDo: [ :aWidget | aWidget editor styler: aStyler ]
]

{ #category : #accessing }
BrEditorAptitude >> text: aText [
	text := aText.
	attributesBuilder attributesTarget: text.
	
	self widgetDo: [ :aWidget | aWidget editor text: aText ]
]
