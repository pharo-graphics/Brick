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
	self notifyStateChanged: hovered
]

{ #category : #initialization }
BrHoverModel >> initialize [
	super initialize.
	
	hovered := false
]

{ #category : #initialization }
BrHoverModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrHoveredRequest reply: [ :aResponse | aResponse hovered: self isHovered ].
	self when: BlDragEnterEvent do: [ :anEvent | self dragEnterEvent: anEvent ].
	self when: BlDragLeaveEvent do: [ :anEvent | self dragLeaveEvent: anEvent ].
	self when: BlMouseOutEvent do: [ :anEvent | self mouseOutEvent: anEvent ].
	self when: BlMouseOverEvent do: [ :anEvent | self mouseOverEvent: anEvent ]
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
BrHoverModel >> streamStateIn: aBrInteractionStatesMapping [
	self isHovered
		ifTrue: [ aBrInteractionStatesMapping addState: BrHoveredState new model: self ]
]
