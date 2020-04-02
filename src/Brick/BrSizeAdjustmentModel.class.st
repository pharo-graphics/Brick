Class {
	#name : #BrSizeAdjustmentModel,
	#superclass : #BrStateModel,
	#instVars : [
		'dimension'
	],
	#category : #'Brick-! Core'
}

{ #category : #printing }
BrSizeAdjustmentModel class >> modelName [
	^ 'Size'
]

{ #category : #'api - configuration' }
BrSizeAdjustmentModel >> beDefault [
	self dimension: BrSizeAdjustmentState defaultName
]

{ #category : #'api - configuration' }
BrSizeAdjustmentModel >> beHuge [
	self dimension: BrSizeAdjustmentState hugeName
]

{ #category : #'api - configuration' }
BrSizeAdjustmentModel >> beLarge [
	self dimension: BrSizeAdjustmentState largeName
]

{ #category : #'api - configuration' }
BrSizeAdjustmentModel >> beMini [
	self dimension: BrSizeAdjustmentState miniName
]

{ #category : #'api - configuration' }
BrSizeAdjustmentModel >> beSmall [
	self dimension: BrSizeAdjustmentState smallName
]

{ #category : #'api - configuration' }
BrSizeAdjustmentModel >> beTiny [
	self dimension: BrSizeAdjustmentState tinyName
]

{ #category : #accessing }
BrSizeAdjustmentModel >> dimension [
	^ dimension
]

{ #category : #accessing }
BrSizeAdjustmentModel >> dimension: aSymbol [

	self dimension = aSymbol
		ifTrue: [ ^ self ].

	dimension := aSymbol.
	self notifyStateChanged: dimension
]

{ #category : #initialization }
BrSizeAdjustmentModel >> initialize [
	super initialize.

	"we use symbols instead of state object to let users easier define their own custom dimension for customs widgets"
	dimension := BrSizeAdjustmentState defaultName
]

{ #category : #initialization }
BrSizeAdjustmentModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrSizeAdjustmentRequest reply: [ :aResponse | aResponse dimension: self dimension ].
	self when: BrSizeAdjustmentWish do: [ :aWish | self dimension: aWish dimension ]
]

{ #category : #printing }
BrSizeAdjustmentModel >> printOn: aStream [
	aStream
		nextPutAll: self modelName, '(';
		nextPutAll: self dimension asString;
		nextPutAll: ')'
]

{ #category : #'state - accessing' }
BrSizeAdjustmentModel >> stateChangedEventClass [
	^ BrSizeAdjustmentChanged
]

{ #category : #'state - streaming' }
BrSizeAdjustmentModel >> streamStateIn: aBrInteractionStatesMapping [
	aBrInteractionStatesMapping
		addState: (BrSizeAdjustmentState new dimension: self dimension)
		model: self
]
