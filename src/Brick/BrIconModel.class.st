Class {
	#name : #BrIconModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'icon'
	],
	#category : #'Brick-! Core'
}

{ #category : #printing }
BrIconModel class >> modelName [
	^ 'Icon'
]

{ #category : #accessing }
BrIconModel >> icon [
	<return: #BlElement>

	^ icon
]

{ #category : #accessing }
BrIconModel >> icon: aStencil [

	icon = aStencil
		ifTrue: [ ^ self ].

	icon := aStencil.
	self notifyIconChanged
]

{ #category : #initialization }
BrIconModel >> initialize [
	super initialize.
	icon := [
		BlElement new
			size: 10 @ 10;
			geometry: BlEllipse new;
			background: Color lightGray;
			border: (BlBorder paint: Color gray width: 1) ] asStencil
]

{ #category : #initialization }
BrIconModel >> initializeListeners [
	super initializeListeners.

	self when: BrIconRequest reply: [ :aResponse | aResponse icon: self icon ]
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
