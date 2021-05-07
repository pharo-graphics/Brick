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
	#name : #BrTextLabelAptitude,
	#superclass : #BrAptitude,
	#traits : 'TBlTextStyleable',
	#classTraits : 'TBlTextStyleable classTrait',
	#instVars : [
		'labelElement'
	],
	#category : #'Brick-! Core - Looks'
}

{ #category : #accessing }
BrTextLabelAptitude >> attributesBuilder [
	<return: #BlTextAttributesBuilder>
	
	^ labelElement attributesBuilder
]

{ #category : #initialization }
BrTextLabelAptitude >> editorMeasurement [
	labelElement editorMeasurement
]

{ #category : #initialization }
BrTextLabelAptitude >> initialize [
	super initialize.

	labelElement := BlAttributedTextElement new
		text: 'Label' asRopedText;
		labelMeasurement;
		padding: (BlInsets all: 1).

	self addChangeAddChildAs: #(content label) with: [ self label ].
]

{ #category : #initialization }
BrTextLabelAptitude >> initializeListeners [
	super initializeListeners.
	
	self when: BrLabelChanged do: [ :anEvent | self text: anEvent text ]
]

{ #category : #initialization }
BrTextLabelAptitude >> initializeRequests [
	super initializeRequests.
	
	self request: BrLabelRequest new
]

{ #category : #accessing }
BrTextLabelAptitude >> label [
	<return: #BlTextElement>
	
	^ labelElement
]

{ #category : #accessing }
BrTextLabelAptitude >> labelDo: aBlock [
	
	self label ifNotNil: aBlock
]

{ #category : #initialization }
BrTextLabelAptitude >> labelMeasurement [
	labelElement labelMeasurement
]

{ #category : #accessing }
BrTextLabelAptitude >> padding: aBlInsets [
	self label padding: aBlInsets
]

{ #category : #accessing }
BrTextLabelAptitude >> text [
	<return: #BlText>

	^ labelElement text
]

{ #category : #accessing }
BrTextLabelAptitude >> text: aTextOrString [
	self label text: aTextOrString asRopedText
]

{ #category : #accessing }
BrTextLabelAptitude >> textDo: aBlock [
	self label textDo: aBlock
]

{ #category : #initialization }
BrTextLabelAptitude >> tightMeasurement [
	labelElement tightMeasurement
]
