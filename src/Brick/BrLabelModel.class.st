"
I am an essential building component of Brick's widget models
"
Class {
	#name : #BrLabelModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'text'
	],
	#category : 'Brick-! Core'
}

{ #category : #'instance creation' }
BrLabelModel class >> text: aStringOrText [
	^ self new text: aStringOrText
]

{ #category : #initialization }
BrLabelModel >> initialize [
	super initialize.
	
	text := 'Tab' asRopedText
]

{ #category : #initialization }
BrLabelModel >> initializeListeners [
	super initializeListeners.

	self when: BrLabelRequest reply: [ :aResponse | aResponse text: self text ]
]

{ #category : #printing }
BrLabelModel >> modelName [
	^ 'Label'
]

{ #category : #notifying }
BrLabelModel >> notifyLabelChanged [
	self dispatchEvent: (BrLabelChanged new text: self text)
]

{ #category : #printing }
BrLabelModel >> printOn: aStream [
	aStream
		nextPutAll: self modelName, '(';
		nextPutAll: self text asString;
		nextPutAll: ')'
]

{ #category : #accessing }
BrLabelModel >> text [
	^ text
]

{ #category : #accessing }
BrLabelModel >> text: aBlTextOrString [
	<event: #BrLabelChanged>

	text = aBlTextOrString
		ifTrue: [ ^ self ].

	text := aBlTextOrString asRopedText.

	self notifyLabelChanged
]
