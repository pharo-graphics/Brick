Class {
	#name : #BrHoverModel,
	#superclass : #BrStateModel,
	#instVars : [
		'hovered'
	],
	#category : #'Brick-! Core'
}

{ #category : #printing }
BrHoverModel class >> modelName [
	^ 'Hover'
]

{ #category : #'mouse handlers' }
BrHoverModel >> dragEnterEvent: anEvent [
	self hovered: true
]

{ #category : #'mouse handlers' }
BrHoverModel >> dragLeaveEvent: anEvent [
	self hovered: false
]

{ #category : #'private - accessing' }
BrHoverModel >> hovered: aBoolean [
	hovered = aBoolean
		ifTrue: [ ^ self ].
		
	hovered := aBoolean.
	self notifyHoverChanged
]

{ #category : #initialization }
BrHoverModel >> initialize [
	super initialize.
	
	hovered := false
]

{ #category : #initialization }
BrHoverModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrHoveredRequest reply: [ :aResponse | aResponse hovered: self isHovered ]
]

{ #category : #testing }
BrHoverModel >> isHovered [
	^ hovered
]

{ #category : #'mouse handlers' }
BrHoverModel >> mouseOutEvent: anEvent [
	anEvent consumed: true.
	
	self hovered: false
]

{ #category : #'mouse handlers' }
BrHoverModel >> mouseOverEvent: anEvent [
	anEvent consumed: true.
	
	self hovered: true
]

{ #category : #notifying }
BrHoverModel >> notifyHoverChanged [
	self dispatchEvent: (BrHoveredChanged hovered: self isHovered)
]

{ #category : #printing }
BrHoverModel >> printOn: aStream [
	aStream
		nextPutAll: self modelName, '(';
		nextPutAll: self isHovered asString;
		nextPutAll: ')'
]

{ #category : #streaming }
BrHoverModel >> stateChangedEventClass [
	^ BrHoveredChanged
]

{ #category : #streaming }
BrHoverModel >> streamStateOn: aStream [
	self isHovered
		ifTrue: [ aStream nextPut: BrHoveredState new ]
]
