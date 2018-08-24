Class {
	#name : #BrPercentValue,
	#superclass : #BrStyleValue,
	#category : 'Brick-Style-Value'
}

{ #category : #'as yet unclassified' }
BrPercentValue >> computeValueFrom: aTargetNode property: aSymbol [
	aTargetNode owner
		ifNotNil: [ :p | 
			| pValue |
			pValue := p height max: p width.
			^ pValue * self value ].
	Error signal: 'a styleable parent must exist in order to apply a relative size '
]
