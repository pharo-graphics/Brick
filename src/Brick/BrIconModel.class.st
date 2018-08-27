Class {
	#name : #BrIconModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'icon'
	],
	#category : 'Brick-! Core'
}

{ #category : #accessing }
BrIconModel >> icon [
	<return: #BlElement>

	^ icon
]

{ #category : #accessing }
BrIconModel >> icon: aBlElement [

	icon = aBlElement
		ifTrue: [ ^ self ].

	icon := aBlElement.
	self notifyIconChanged
]

{ #category : #initialization }
BrIconModel >> initialize [
	super initialize.
	
	icon := (BlEllipse radius: 5) asElement
]

{ #category : #initialization }
BrIconModel >> initializeListeners [
	super initializeListeners.

	self when: BrIconRequest reply: [ :aResponse | aResponse icon: self icon ]
]

{ #category : #printing }
BrIconModel >> modelName [
	^ 'Icon'
]

{ #category : #notifying }
BrIconModel >> notifyIconChanged [
	self dispatchEvent: (BrIconChanged new icon: self icon)
]

{ #category : #printing }
BrIconModel >> printOn: aStream [
	aStream
		nextPutAll: self modelName, '(';
		nextPutAll: self icon asString;
		nextPutAll: ')'
]
