Class {
	#name : #BrColorLinearNormalizer,
	#superclass : #BrLinearNormalizer,
	#instVars : [
		'minBrightness',
		'maxBrightness',
		'lowColor',
		'highColor'
	],
	#category : #'Brick-Glamorous-Normalizer'
}

{ #category : #'instance creation' }
BrColorLinearNormalizer class >> inContext: aCollection lowColor: lowColor highColor: highColor [
	
	| normalizer |
	normalizer := self inContext: aCollection.
	normalizer lowColor: lowColor.
	normalizer highColor: highColor.
	^normalizer
]

{ #category : #'instance creation' }
BrColorLinearNormalizer class >> inContext: aCollection lowColor: lowColor lowThreshold: lowThreshold highColor: highColor highThreshold: highThreshold [
	
	| normalizer |
	normalizer := self inContext: aCollection.
	normalizer lowColor: lowColor.
	normalizer highColor: highColor.
	normalizer minBrightness: lowThreshold.
	normalizer maxBrightness: highThreshold.
	^normalizer
]

{ #category : #'instance creation' }
BrColorLinearNormalizer class >> inContext: aCollection withCommand: aBlock lowColor: lowColor highColor: highColor [
	
	| normalizer |
	normalizer := self inContext: aCollection withCommand: aBlock.
	normalizer lowColor: lowColor.
	normalizer highColor: highColor.
	^normalizer
]

{ #category : #'instance creation' }
BrColorLinearNormalizer class >> inContext: aCollection withCommand: aBlock lowColor: lowColor lowThreshold: lowThreshold highColor: highColor highThreshold: highThreshold [
	
	| normalizer |
	normalizer := self inContext: aCollection withCommand: aBlock.
	normalizer lowColor: lowColor.
	normalizer highColor: highColor.
	normalizer minBrightness: lowThreshold.
	normalizer maxBrightness: highThreshold.
	^normalizer
]

{ #category : #private }
BrColorLinearNormalizer >> blend: aColor with: aColorValue weight: wt [
	"Answer a new ColorValue which is a weighted blend of the receiver and the
	supplied ColorValue."
	"Simply interpolates in RGB space."

	| rv gv bv invWt av |
	
	invWt := 1-wt.
	rv := ((aColor red * invWt) + ((aColorValue red)*wt)) "rounded".
	gv := ((aColor green  * invWt) + ((aColorValue green)*wt)) "rounded".
	bv := ((aColor blue * invWt) + ((aColorValue blue)*wt)) "rounded".
	av := ((aColor alpha * invWt) + ((aColorValue alpha)*wt)).
	^Color r: rv g: gv b: bv alpha: av
]

{ #category : #accessing }
BrColorLinearNormalizer >> highColor: aBlock [
	
	highColor := aBlock
]

{ #category : #'translator protocol' }
BrColorLinearNormalizer >> highColorFor: anEntity [
	
	^ highColor
]

{ #category : #'initialize-release' }
BrColorLinearNormalizer >> initialize [
	
	super initialize.
	lowColor := Color white.
	highColor := Color black
]

{ #category : #accessing }
BrColorLinearNormalizer >> lowColor: aBlock [
	
	lowColor := aBlock
]

{ #category : #'translator protocol' }
BrColorLinearNormalizer >> lowColorFor: anEntity [
	
	^lowColor
]

{ #category : #accessing }
BrColorLinearNormalizer >> maxBrightness: aBlock [
	
	maxBrightness := aBlock
]

{ #category : #'translator protocol' }
BrColorLinearNormalizer >> maxBrightnessFor: anEntity [
	
	^maxBrightness isNil
		ifTrue: [1.0]
		ifFalse: [maxBrightness cull: anEntity]
]

{ #category : #accessing }
BrColorLinearNormalizer >> minBrightness: aBlock [
	
	minBrightness := aBlock
]

{ #category : #'translator protocol' }
BrColorLinearNormalizer >> minBrightnessFor: anEntity [
	
	^minBrightness isNil
		ifTrue: [0.0]
		ifFalse: [minBrightness cull: anEntity]
]

{ #category : #accessing }
BrColorLinearNormalizer >> value: anEntity [
	"Calculates the color of the entity based on the context."

	| myValue myHighColor myLowColor myMinBrightness myMaxBrightness weight minValue maxValue |
	"Get color specific data"
	minValue := self minimumValue: anEntity.
	maxValue := self maximumValue.
	myMinBrightness := self minBrightnessFor: anEntity.
	myMaxBrightness := self maxBrightnessFor: anEntity.
	myHighColor := self highColorFor: anEntity.
	myLowColor := self lowColorFor: anEntity.	"Get data"
	weight := minValue = maxValue
		ifTrue: [ (myMinBrightness + myMaxBrightness) / 2 ]
		ifFalse: [ myValue := (self command cull: anEntity)
				- (self minimumValue: anEntity).
			myMinBrightness
				+
					(myValue abs / (maxValue - minValue)
						* (myMaxBrightness - myMinBrightness)) ].
	^ self blend: myLowColor with: myHighColor weight: weight
]
