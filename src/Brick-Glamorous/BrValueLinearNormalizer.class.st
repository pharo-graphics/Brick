Class {
	#name : #BrValueLinearNormalizer,
	#superclass : #BrLinearNormalizer,
	#instVars : [
		'minScale',
		'maxScale'
	],
	#category : #'Brick-Glamorous-Normalizer'
}

{ #category : #'initialize-release' }
BrValueLinearNormalizer >> initialize [

	super initialize.
	minScale := 0.
	maxScale := 1.
]

{ #category : #accessing }
BrValueLinearNormalizer >> maxScale [

	^maxScale.
]

{ #category : #accessing }
BrValueLinearNormalizer >> maxScale: aValue [

	^maxScale := aValue.
]

{ #category : #accessing }
BrValueLinearNormalizer >> minScale [

	^minScale.
]

{ #category : #accessing }
BrValueLinearNormalizer >> minScale: aValue [

	minScale := aValue.
]

{ #category : #accessing }
BrValueLinearNormalizer >> slope: anEntity [
	^ (maxScale - minScale)
		/
			(self maximumValue asFloat - (self minimumValue: anEntity) asFloat)
]

{ #category : #accessing }
BrValueLinearNormalizer >> value: anEntity [
	"Normalize value based on minimum and maximum value."

	| value slope |
	value := self command cull: anEntity.
	slope := self slope: anEntity.
	^ (value abs * slope + self maxScale
		- (self maximumValue asFloat * slope)) asInteger
]
