Class {
	#name : #BrDescriptionModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'text'
	],
	#category : #'Brick-! Core - Models'
}

{ #category : #printing }
BrDescriptionModel class >> modelName [
	^ 'Description'
]

{ #category : #'instance creation' }
BrDescriptionModel class >> text: aStringOrText [
	^ self new text: aStringOrText
]

{ #category : #initialization }
BrDescriptionModel >> initialize [
	super initialize.
	
	text := 'Description' asRopedText
]

{ #category : #initialization }
BrDescriptionModel >> initializeListeners [
	super initializeListeners.

	self when: BrDescriptionRequest reply: [ :aResponse | aResponse text: self text ]
]

{ #category : #notifying }
BrDescriptionModel >> notifyLabelChanged [
	self dispatchEvent: (BrDescriptionChanged new text: self text)
]

{ #category : #printing }
BrDescriptionModel >> printOn: aStream [
	aStream
		nextPutAll: self modelName, '(';
		nextPutAll: self text asString;
		nextPutAll: ')'
]

{ #category : #accessing }
BrDescriptionModel >> text [
	^ text
]

{ #category : #accessing }
BrDescriptionModel >> text: aBlTextOrString [
	<event: #BrLabelChanged>

	text = aBlTextOrString
		ifTrue: [ ^ self ].

	text := aBlTextOrString asRopedText.

	self notifyLabelChanged
]
