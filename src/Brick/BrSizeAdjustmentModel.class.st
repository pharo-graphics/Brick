Class {
	#name : #BrSizeAdjustmentModel,
	#superclass : #BrStateModel,
	#instVars : [
		'dimension'
	],
	#category : #'Brick-! Deprecated'
}

{ #category : #testing }
BrSizeAdjustmentModel class >> isDeprecated [
	^ true
]

{ #category : #printing }
BrSizeAdjustmentModel class >> modelName [
	^ 'Size'
]

{ #category : #'api - configuration' }
BrSizeAdjustmentModel >> beDefault [
	self dimension: BrDeprecatedSizeAdjustmentState defaultName
]

{ #category : #'api - configuration' }
BrSizeAdjustmentModel >> beHuge [
	self dimension: BrDeprecatedSizeAdjustmentState hugeName
]

{ #category : #'api - configuration' }
BrSizeAdjustmentModel >> beLarge [
	self dimension: BrDeprecatedSizeAdjustmentState largeName
]

{ #category : #'api - configuration' }
BrSizeAdjustmentModel >> beMini [
	self dimension: BrDeprecatedSizeAdjustmentState miniName
]

{ #category : #'api - configuration' }
BrSizeAdjustmentModel >> beSmall [
	self dimension: BrDeprecatedSizeAdjustmentState smallName
]

{ #category : #'api - configuration' }
BrSizeAdjustmentModel >> beTiny [
	self dimension: BrDeprecatedSizeAdjustmentState tinyName
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
	dimension := BrDeprecatedSizeAdjustmentState defaultName
]

{ #category : #initialization }
BrSizeAdjustmentModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrSizeAdjustmentRequest reply: [ :aResponse | aResponse dimension: self dimension ].
	self when: BrDeprecatedSizeAdjustmentWish do: [ :aWish | self dimension: aWish dimension ]
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
		addState: (BrDeprecatedSizeAdjustmentState new dimension: self dimension)
		model: self
]
