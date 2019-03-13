Class {
	#name : #BrNumberLinearNormalizer,
	#superclass : #BrLinearNormalizer,
	#instVars : [
		'scale'
	],
	#category : #'Brick-Glamorous-Normalizer'
}

{ #category : #initialization }
BrNumberLinearNormalizer >> initialize [
	super initialize.
	scale := 1
]

{ #category : #accessing }
BrNumberLinearNormalizer >> scale [
	^ scale
]

{ #category : #accessing }
BrNumberLinearNormalizer >> scale: anObject [
	scale := anObject
]

{ #category : #accessing }
BrNumberLinearNormalizer >> value: anEntity [
	"Normalize value based on maximum value."

	| value |
	value := self command cull: anEntity.
	^ ((value abs / self maximumValue) asFloat * self scale) asInteger
]
