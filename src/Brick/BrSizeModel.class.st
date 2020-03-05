Class {
	#name : #BrSizeModel,
	#superclass : #BrStateModel,
	#instVars : [
		'dimension'
	],
	#category : #'Brick-! Core'
}

{ #category : #printing }
BrSizeModel class >> modelName [
	^ 'Size'
]

{ #category : #'api - configuration' }
BrSizeModel >> beDefault [
	self dimension: BrSizeState defaultName
]

{ #category : #'api - configuration' }
BrSizeModel >> beHuge [
	self dimension: BrSizeState hugeName
]

{ #category : #'api - configuration' }
BrSizeModel >> beLarge [
	self dimension: BrSizeState largeName
]

{ #category : #'api - configuration' }
BrSizeModel >> beSmall [
	self dimension: BrSizeState smallName
]

{ #category : #'api - configuration' }
BrSizeModel >> beTiny [
	self dimension: BrSizeState tinyName
]

{ #category : #accessing }
BrSizeModel >> dimension [
	^ dimension
]

{ #category : #accessing }
BrSizeModel >> dimension: aSymbol [

	self dimension = aSymbol
		ifTrue: [ ^ self ].

	dimension := aSymbol.
	self notifyStateChanged: dimension
]

{ #category : #initialization }
BrSizeModel >> initialize [
	super initialize.

	"we use symbols instead of state object to let users easier define their own custom dimension for customs widgets"
	dimension := BrSizeState defaultName
]

{ #category : #initialization }
BrSizeModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrDimensionRequest reply: [ :aResponse | aResponse dimension: self dimension ]
]

{ #category : #printing }
BrSizeModel >> printOn: aStream [
	aStream
		nextPutAll: self modelName, '(';
		nextPutAll: self dimension asString;
		nextPutAll: ')'
]

{ #category : #'state - accessing' }
BrSizeModel >> stateChangedEventClass [
	^ BrDimensionChanged
]

{ #category : #'state - streaming' }
BrSizeModel >> streamStateIn: aBrInteractionStatesMapping [
	aBrInteractionStatesMapping
		addState: (BrSizeState new dimension: self dimension)
		model: self
]
