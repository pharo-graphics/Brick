"
I am a look that automatically adds a text label to the content element in a widget element. 

I am independent of the widget model and the widget element. 
If the widget model  responds to the ==BrLabelRequest== and replies with a corresponding ==BrLabelChanged== event, then I automatically update the label based on the model.

For example, in a subclass of a ViewModel override ==#onAttachedTo:== and implement:
[[[
	self when: BrLabelRequest reply: [ BrLabelChanged new text: self label ].
]]]

The label look can directly change properties of the label element. This can be usefull when one want to customize the existing look, or change layout properties:
[[[example=BrButtonLabelLookExamples>>#buttonLabelLookWithConstraints|expanded=true|expandedPreview=false|show=gtLiveIn:]]]

"
Class {
	#name : #BrTextLabelLook,
	#superclass : #BrLook,
	#traits : 'TBlTextStyleable',
	#classTraits : 'TBlTextStyleable classTrait',
	#instVars : [
		'labelElement',
		'attributesBuilder',
		'text'
	],
	#category : #'Brick-! Core - Looks'
}

{ #category : #accessing }
BrTextLabelLook >> attributesBuilder [
	<return: #BlTextAttributesBuilder>
	
	^ attributesBuilder
]

{ #category : #initialization }
BrTextLabelLook >> initialize [
	super initialize.
	self addChangeAddChildAs: #(content label) with: [ self label ].
	text := 'Label' asRopedText.
	labelElement := BlTextElement new.
	labelElement text: text.
	labelElement labelMeasurement.
	labelElement padding: (BlInsets all: 1).
	
	attributesBuilder := BlTextDelegatedAttributesBuilder new.
	attributesBuilder attributesTarget: text.
	attributesBuilder whenAdded: [ labelElement textChanged ]
]

{ #category : #initialization }
BrTextLabelLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrLabelChanged do: [ :anEvent | self text: anEvent text ]
]

{ #category : #initialization }
BrTextLabelLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrLabelRequest new
]

{ #category : #accessing }
BrTextLabelLook >> label [
	<return: #BlTextElement>
	
	^ labelElement
]

{ #category : #accessing }
BrTextLabelLook >> labelDo: aBlock [	
	aBlock value: self label
]

{ #category : #accessing }
BrTextLabelLook >> padding: aBlInsets [
	self label padding: aBlInsets
]

{ #category : #accessing }
BrTextLabelLook >> text [
	<return: #BlText>

	^ text
]

{ #category : #accessing }
BrTextLabelLook >> text: aTextOrString [
	text := aTextOrString asRopedText.
	self attributesBuilder attributesTarget: text.
	self label text: text
]

{ #category : #accessing }
BrTextLabelLook >> textDo: aBlock [
	self label textDo: aBlock
]
