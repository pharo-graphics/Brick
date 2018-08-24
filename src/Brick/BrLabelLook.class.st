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
	#name : #BrLabelLook,
	#superclass : #BrLook,
	#traits : 'TBlTextStyleable',
	#classTraits : 'TBlTextStyleable classTrait',
	#instVars : [
		'labelElement',
		'attributesBuilder',
		'text'
	],
	#category : 'Brick-! Core'
}

{ #category : #accessing }
BrLabelLook >> attributesBuilder [
	<return: #BlTextAttributesBuilder>
	
	^ attributesBuilder
]

{ #category : #initialization }
BrLabelLook >> initialize [
	super initialize.
	
	text := 'Label' asRopedText.
	
	attributesBuilder := BlTextDelegatedAttributesBuilder new.
	attributesBuilder attributesTarget: text.
	
	labelElement := BlTextElement new.
	labelElement clipChildren: false
]

{ #category : #initialization }
BrLabelLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrLabelChanged do: [ :anEvent | self text: anEvent text ]
]

{ #category : #initialization }
BrLabelLook >> initializeLook [
	super initializeLook.

	labelElement text: text.
	self widgetContent addChild: labelElement as: #label
]

{ #category : #initialization }
BrLabelLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrLabelRequest new
]

{ #category : #accessing }
BrLabelLook >> label [
	<return: #BlTextElement>
	
	^ labelElement
]

{ #category : #accessing }
BrLabelLook >> labelDo: aBlock [	
	aBlock value: self label
]

{ #category : #accessing }
BrLabelLook >> text [
	<return: #BlText>

	^ text
]

{ #category : #accessing }
BrLabelLook >> text: aTextOrString [
	text := aTextOrString asRopedText.
	
	self attributesBuilder attributesTarget: text.
	self label text: text
]

{ #category : #accessing }
BrLabelLook >> textDo: aBlock [
	self label textDo: aBlock
]
