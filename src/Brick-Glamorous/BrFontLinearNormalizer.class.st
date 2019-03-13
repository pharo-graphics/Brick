Class {
	#name : #BrFontLinearNormalizer,
	#superclass : #BrLinearNormalizer,
	#category : #'Brick-Glamorous-Normalizer'
}

{ #category : #accessing }
BrFontLinearNormalizer >> value: anEntity [
	"Calculates the color of the entity based on the context."

	| value |
	value := self command cull: anEntity.
	^ 5 + (38 * (value abs / self maximumValue)) asInteger
]
