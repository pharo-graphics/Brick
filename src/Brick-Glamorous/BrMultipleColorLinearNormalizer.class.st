Class {
	#name : #BrMultipleColorLinearNormalizer,
	#superclass : #BrGlamorousNormalizer,
	#instVars : [
		'normalizers'
	],
	#category : #'Brick-Glamorous-Normalizer'
}

{ #category : #'instance creation' }
BrMultipleColorLinearNormalizer class >> valueRange: anArrayOfNumbers colorRange: anArrayOfColors [

	^ self new valueRange: anArrayOfNumbers colorRange: anArrayOfColors
]

{ #category : #accessing }
BrMultipleColorLinearNormalizer >> cull: anEntity [

	| value |
	value := self command cull: anEntity.
	"detect range for the value, retrieve and call corresponding normalizers"
	^ (self detectNormalizerFor: value) cull: value
]

{ #category : #'private-accessing' }
BrMultipleColorLinearNormalizer >> detectNormalizerFor: aValue [

	normalizers keysAndValuesDo: [:range :norm |
		(range rangeIncludes: aValue)
			ifTrue: [^ norm] ].
	self error: aValue asString, ' not in declared ranges'
]

{ #category : #'initialize-release' }
BrMultipleColorLinearNormalizer >> initialize [

	command := #yourself
]

{ #category : #accessing }
BrMultipleColorLinearNormalizer >> value: anEntity [

	| value |
	value := self command cull: anEntity.
	"detect range for the value, retrieve and call corresponding normalizers"
	^ (self detectNormalizerFor: value) cull: value
]

{ #category : #'initialize-release' }
BrMultipleColorLinearNormalizer >> valueRange: anArrayOfNumbers colorRange: anArrayOfColors [
	" {1. 2. 3} {Color red. Color yellow. Color green}"
	
	| size start end |
	normalizers := Dictionary new.
	self assert: anArrayOfNumbers size = anArrayOfColors size.
	size := anArrayOfNumbers size.
	1 to: size - 1 do: [ :i |
		start := anArrayOfNumbers at: i.
		end :=  anArrayOfNumbers at: i + 1.
		normalizers
			at: (start to: end)
			put: (BrColorLinearNormalizer
						inContext: (Array with: start with: end)
						lowColor: (anArrayOfColors at: i)
						highColor: (anArrayOfColors at: i + 1))
	].

]
