Class {
	#name : #BrLinearNormalizer,
	#superclass : #BrGlamorousNormalizer,
	#instVars : [
		'maximumValue',
		'context',
		'minimumValue'
	],
	#category : #'Brick-Glamorous-Normalizer'
}

{ #category : #'instance creation' }
BrLinearNormalizer class >> inContext: aCollection [
	
	^self inContext: aCollection withCommand: #yourself
]

{ #category : #'instance creation' }
BrLinearNormalizer class >> inContext: aCollection withCommand: aBlock [
	
	^(self new)
		context: aCollection;
		command: aBlock;
		yourself
]

{ #category : #accessing }
BrLinearNormalizer >> command: aBlock [
	
	super command: aBlock.
	self flushCache
]

{ #category : #accessing }
BrLinearNormalizer >> context [
	
	^context
]

{ #category : #accessing }
BrLinearNormalizer >> context: aContext [
	
	context := aContext.
	self flushCache
]

{ #category : #accessing }
BrLinearNormalizer >> flushCache [
	
	maximumValue := nil
]

{ #category : #'initialize-release' }
BrLinearNormalizer >> initialize [
	"Initialize a newly created instance. This method must answer the receiver."
	
	super initialize.
	maximumValue := nil
]

{ #category : #private }
BrLinearNormalizer >> maximumValue [
	"Returns the largest value that the color metric provides"
	
	maximumValue isNil
		ifTrue:
			[maximumValue := (self context)
				inject: 1
				into: 	[:maximum :entity | maximum max: (self command cull: entity)]].
	^maximumValue
]

{ #category : #private }
BrLinearNormalizer >> minimumValue: anEntity [
	"Returns the smallest value that the color metric provides"
	
	minimumValue isNil
		ifTrue:
			[minimumValue := (self context collect: [ :each | self command cull: each ])
				inject: 100000000000 
				into: [:minimum :entity | minimum min: (self command cull: entity)]].
	^minimumValue
]
