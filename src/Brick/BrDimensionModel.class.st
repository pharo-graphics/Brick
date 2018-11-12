Class {
	#name : #BrDimensionModel,
	#superclass : #BrStateModel,
	#instVars : [
		'dimension'
	],
	#category : #'Brick-! Core'
}

{ #category : #printing }
BrDimensionModel class >> modelName [
	^ 'Size'
]

{ #category : #'api - configuration' }
BrDimensionModel >> beDefault [
	self dimension: BrDimensionState defaultName
]

{ #category : #'api - configuration' }
BrDimensionModel >> beHuge [
	self dimension: BrDimensionState hugeName
]

{ #category : #'api - configuration' }
BrDimensionModel >> beLarge [
	self dimension: BrDimensionState largeName
]

{ #category : #'api - configuration' }
BrDimensionModel >> beSmall [
	self dimension: BrDimensionState smallName
]

{ #category : #'api - configuration' }
BrDimensionModel >> beTiny [
	self dimension: BrDimensionState tinyName
]

{ #category : #accessing }
BrDimensionModel >> dimension [
	^ dimension
]

{ #category : #accessing }
BrDimensionModel >> dimension: aSymbol [

	self dimension = aSymbol
		ifTrue: [ ^ self ].

	dimension := aSymbol.
	self notifyStateChanged: dimension
]

{ #category : #initialization }
BrDimensionModel >> initialize [
	super initialize.

	"we use symbols instead of state object to let users easier define their own custom dimension for customs widgets"
	dimension := BrDimensionState defaultName
]

{ #category : #initialization }
BrDimensionModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrDimensionRequest reply: [ :aResponse | aResponse dimension: self dimension ]
]

{ #category : #printing }
BrDimensionModel >> printOn: aStream [
	aStream
		nextPutAll: self modelName, '(';
		nextPutAll: self dimension asString;
		nextPutAll: ')'
]

{ #category : #'state - accessing' }
BrDimensionModel >> stateChangedEventClass [
	^ BrDimensionChanged
]

{ #category : #'state - streaming' }
BrDimensionModel >> streamStateOn: aStream [
	aStream nextPut: (BrDimensionState new dimension: self dimension)
]
