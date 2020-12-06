Class {
	#name : #BrHoverModel,
	#superclass : #BrStateModel,
	#instVars : [
		'hovered'
	],
	#category : #'Brick-! Core'
}

{ #category : #testing }
BrHoverModel class >> isDeprecated [
	^ true
]

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
	self when: BlMouseEnterEvent do: [ :anEvent | self mouseEnterEvent: anEvent ].
	self when: BlMouseLeaveEvent do: [ :anEvent | self mouseLeaveEvent: anEvent ]
]

{ #category : #testing }
BrHoverModel >> isHovered [
	^ hovered
]

{ #category : #'mouse handlers' }
BrHoverModel >> mouseEnterEvent: anEvent [
	self hovered: true
]

{ #category : #'mouse handlers' }
BrHoverModel >> mouseLeaveEvent: anEvent [
	self hovered: false
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
