"
I am an essential building component of Brick's widget models
"
Class {
	#name : #BrLabelModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'text'
	],
	#category : #'Brick-! Core - Models'
}

{ #category : #printing }
BrLabelModel class >> modelName [
	^ 'Label'
]

{ #category : #'instance creation' }
BrLabelModel class >> text: aStringOrText [
	^ self new text: aStringOrText
]

{ #category : #initialization }
BrLabelModel >> initialize [
	super initialize.
	
	text := 'Label' asRopedText
]

{ #category : #initialization }
BrLabelModel >> initializeListeners [
	super initializeListeners.

	self when: BrLabelRequest reply: [ :aResponse | aResponse text: self text ]
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
	<return: #BlText>

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
